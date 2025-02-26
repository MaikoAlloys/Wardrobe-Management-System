<?php

namespace App\Http\Controllers;

use App\Models\ClothingItem;
use Illuminate\Http\Request;

class ClothingItemController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        return response()->json(ClothingItem::all(), 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'category' => 'required|string|max:255',
            'color' => 'nullable|string|max:255',
            'size' => 'nullable|string|max:255',
            'image' => 'nullable|string',
            'user_id' => 'required|exists:users,id',
        ]);

        $item = ClothingItem::create($request->all());

        return response()->json($item, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        $item = ClothingItem::find($id);
        if (!$item) {
            return response()->json(['message' => 'Clothing item not found'], 404);
        }
        return response()->json($item, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $id)
    {
        $item = ClothingItem::findOrFail($id);
        $request->validate([
            'name' => 'sometimes|string|max:255',
            'category' => 'sometimes|string|max:255',
            'color' => 'nullable|string|max:255',
            'size' => 'nullable|string|max:255',
            'image' => 'nullable|string',
        ]);

        $item->update($request->all());

        return response()->json($item, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $item = ClothingItem::find($id);
        if (!$item) {
            return response()->json(['message' => 'Clothing item not found'], 404);
        }

        $item->delete();
        return response()->json(['message' => 'Clothing item deleted successfully'], 200);
    }
}
