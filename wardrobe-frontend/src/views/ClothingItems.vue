<template>
    <div class="container">
        <h2>Manage Clothing Items</h2>

        <!-- Add New Clothing Item Form -->
        <form @submit.prevent="addItem">
            <input v-model="newItem.name" type="text" placeholder="Item Name" required />
            <input v-model="newItem.category" type="text" placeholder="Category" required />
            <input v-model="newItem.color" type="text" placeholder="Color" />
            <input v-model="newItem.size" type="text" placeholder="Size" />
            <button type="submit">Add Item</button>
        </form>

        <!-- Clothing Items List -->
        <ul>
            <li v-for="item in clothingItems" :key="item.id">
                <span>{{ item.name }} ({{ item.category }}) - {{ item.color }} / {{ item.size }}</span>
                <button @click="editItem(item)">Edit</button>
                <button @click="deleteItem(item.id)">Delete</button>
            </li>
        </ul>

        <!-- Edit Item Modal -->
        <div v-if="editingItem" class="modal">
            <div class="modal-content">
                <h3>Edit Item</h3>
                <input v-model="editingItem.name" type="text" required />
                <input v-model="editingItem.category" type="text" required />
                <input v-model="editingItem.color" type="text" />
                <input v-model="editingItem.size" type="text" />
                <button @click="updateItem">Update</button>
                <button @click="editingItem = null">Cancel</button>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            clothingItems: [],
            newItem: { name: '', category: '', color: '', size: '' },
            editingItem: null,
        };
    },
    methods: {
        async fetchItems() {
            try {
                const response = await axios.get('http://127.0.0.1:8000/api/clothing-items');
                this.clothingItems = response.data;
            } catch (error) {
                console.error('Error fetching items:', error);
            }
        },
        async addItem() {
            try {
                const response = await axios.post('http://127.0.0.1:8000/api/clothing-items', this.newItem);
                this.clothingItems.push(response.data);
                this.newItem = { name: '', category: '', color: '', size: '' };
            } catch (error) {
                console.error('Error adding item:', error);
            }
        },
        editItem(item) {
            this.editingItem = { ...item };
        },
        async updateItem() {
            try {
                await axios.put(`http://127.0.0.1:8000/api/clothing-items/${this.editingItem.id}`, this.editingItem);
                this.fetchItems();
                this.editingItem = null;
            } catch (error) {
                console.error('Error updating item:', error);
            }
        },
        async deleteItem(id) {
            try {
                await axios.delete(`http://127.0.0.1:8000/api/clothing-items/${id}`);
                this.clothingItems = this.clothingItems.filter(item => item.id !== id);
            } catch (error) {
                console.error('Error deleting item:', error);
            }
        }
    },
    mounted() {
        this.fetchItems();
    }
};
</script>

<style scoped>
.container {
    max-width: 500px;
    margin: auto;
    text-align: center;
}
input {
    display: block;
    width: 100%;
    padding: 8px;
    margin: 5px 0;
}
button {
    margin: 5px;
    padding: 8px;
    cursor: pointer;
}
ul {
    list-style-type: none;
    padding: 0;
}
li {
    padding: 10px;
    border: 1px solid #ddd;
    margin: 5px 0;
}
.modal {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: white;
    padding: 20px;
    border: 1px solid #ccc;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
}
</style>
