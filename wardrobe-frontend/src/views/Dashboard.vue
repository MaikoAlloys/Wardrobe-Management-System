<template>
  <div class="container">
    <!-- Navbar -->
    <nav class="navbar">
      <h1> Wardrobe</h1>
      <div>
        <button @click="showAddForm = !showAddForm">Add Item</button>
        <button @click="logout">Logout</button>
      </div>
    </nav>

    <div class="dashboard-container">
      <p>Manage your wardrobe with ease.</p>

      <!-- Filter and Search -->
      <div class="filters">
        <input v-model="searchQuery" type="text" placeholder="Search items..." />
        <select v-model="selectedCategory">
          <option value="">All Categories</option>
          <option value="">Vest</option>
          <option value="">Pants</option>
          <option value="">Jacket</option>
          <option value="">Sneakers</option>
          <option v-for="category in categories" :key="category">{{ category }}</option>
        </select>
      </div>

      <!-- Add New Item Section -->
      <form v-if="showAddForm" @submit.prevent="addItem" class="add-form">
        <input v-model="newItem.name" type="text" placeholder="Item Name" required />
        <input v-model="newItem.category" type="text" placeholder="Category" required />
        <input v-model="newItem.color" type="text" placeholder="Color" />
        <input v-model="newItem.size" type="text" placeholder="Size" />
        <button type="submit">Add Item</button>
      </form>

      <!-- Clothing Items List - Grid Layout -->
      <div class="card-grid">
        <div class="card" v-for="item in filteredItems" :key="item.id">
          <h3>{{ item.name }}</h3>
          <p><strong>Category:</strong> {{ item.category }}</p>
          <p><strong>Color:</strong> {{ item.color }}</p>
          <p><strong>Size:</strong> {{ item.size }}</p>
          <div class="card-actions">
            <button @click="editItem(item)" class="edit-btn">Edit</button>
            <button @click="deleteItem(item.id)" class="delete-btn">Delete</button>
          </div>
        </div>
      </div>

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
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from "vue";
import { useRouter } from "vue-router";
import axios from "axios";

// Router
const router = useRouter();
const logout = () => {
  alert("Logged out successfully!");
  router.push("/");
};

// State Variables
const clothingItems = ref([]);
const newItem = ref({ name: "", category: "", color: "", size: "" });
const editingItem = ref(null);
const searchQuery = ref("");
const selectedCategory = ref("");
const showAddForm = ref(false);

// Computed Property for Filtering Items
const filteredItems = computed(() => {
  return clothingItems.value.filter(item => {
    return (
      (!selectedCategory.value || item.category === selectedCategory.value) &&
      item.name.toLowerCase().includes(searchQuery.value.toLowerCase())
    );
  });
});

// Fetch Clothing Items
const fetchItems = async () => {
  try {
    const response = await axios.get("http://127.0.0.1:8000/api/clothing-items");
    console.log("Fetched Items:", response.data);
    clothingItems.value = response.data;
  } catch (error) {
    console.error("Error fetching items:", error);
  }
};

// Add New Item
const addItem = async () => {
  try {
    const response = await axios.post("http://127.0.0.1:8000/api/clothing-items", newItem.value);
    clothingItems.value.push(response.data);
    newItem.value = { name: "", category: "", color: "", size: "" };
    showAddForm.value = false;
  } catch (error) {
    console.error("Error adding item:", error);
  }
};

// Edit Item
const editItem = (item) => {
  editingItem.value = { ...item };
};

// Update Item
const updateItem = async () => {
  try {
    await axios.put(`http://127.0.0.1:8000/api/clothing-items/${editingItem.value.id}`, editingItem.value);
    fetchItems();
    editingItem.value = null;
  } catch (error) {
    console.error("Error updating item:", error);
  }
};

// Delete Item
const deleteItem = async (id) => {
  try {
    await axios.delete(`http://127.0.0.1:8000/api/clothing-items/${id}`);
    clothingItems.value = clothingItems.value.filter(item => item.id !== id);
  } catch (error) {
    console.error("Error deleting item:", error);
  }
};

// Fetch items when component mounts
onMounted(fetchItems);
</script>

<style scoped>
/* Container */
.container {
  width: 100%;
  height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  padding-top: 60px;
}

/* Navbar */
.navbar {
  width: 100%;
  position: fixed;
  top: 0;
  left: 0;
  background: #333;
  color: white;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px 20px;
}

.dashboard-container {
  text-align: center;
  margin-top: 20px;
  width: 80%;
}

/* Filters */
.filters {
  display: flex;
  justify-content: center;
  gap: 10px;
  margin-bottom: 20px;
}

input, select {
  padding: 8px;
  margin: 5px;
}

/* Responsive Grid Layout */
.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 25px;
  width: 100%;
  max-width: 1200px;
  margin: auto;
  padding: 20px;
}

/* Card Styling */
.card {
  background: white;
  padding: 15px;
  border-radius: 10px;
  box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
  text-align: center;
  transition: 0.3s;
}

.card:hover {
  transform: scale(1.03);
}

/* Card Actions */
.card-actions {
  display: flex;
  justify-content: space-between;
  margin-top: 10px;
}

.edit-btn {
  background-color: #007bff;
  color: white;
  padding: 8px;
  border-radius: 5px;
  border: none;
  cursor: pointer;
}

.delete-btn {
  background-color: #ff4d4d;
  color: white;
  padding: 8px;
  border-radius: 5px;
  border: none;
  cursor: pointer;
}

/* Modal */
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
h3 {
  font-weight: bold;
}
.edit-btn {
  background-color: #333; /* Dark gray/black */
  color: white; /* White text for contrast */
  padding: 8px 12px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background 0.3s ease;
}

.edit-btn:hover {
  background-color: #222; /* Slightly darker on hover */
}

</style>
