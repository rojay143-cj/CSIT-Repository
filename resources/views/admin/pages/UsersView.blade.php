@extends('admin.dashboard.adminDashboard')

@section('content')

<meta name="csrf-token" content="{{ csrf_token() }}">

<div class="container mx-auto p-6 bg-white rounded-xl shadow-md">
    <div class="flex justify-between items-center mb-4">
        <h1 style="font-size: 40px; font-weight: bold;">Users</h1>
        <a href="{{ route('admin.users.view') }}" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-lg flex items-center">
            <i class="fas fa-plus mr-2"></i> Add User
        </a>
    </div>

    <!-- Search & Filters -->
    <div class="flex flex-wrap gap-4 mb-4">
        <input type="text" id="searchInput" placeholder="Search by name or email..." 
            class="p-2 border rounded-lg flex-1 min-w-[200px]" onkeyup="filterUsers()">
        
        <!-- Role Filter -->
        <select id="roleFilter" class="p-2 border rounded-lg min-w-[150px]" onchange="filterUsers()">
            <option value="">All Roles</option>
            <option value="admin">Admin</option>
            <option value="staff">Staff</option>
            <option value="faculty">Faculty</option>
            <option value="user">User</option>
        </select>

        <!-- Status Filter -->
        <select id="statusFilter" class="p-2 border rounded-lg min-w-[150px]" onchange="filterUsers()">
            <option value="">All Statuses</option>
            <option value="active">Active</option>
            <option value="inactive">Inactive</option>
            <option value="pending">Pending</option>
            <option value="deactivated">Deactivated</option>
        </select>
    </div>

    <table class="min-w-full border border-gray-300 text-center">
        <thead>
            <tr>
                <th class="py-3 px-6 bg-gray-800 text-gray-600 font-semibold">ID</th>
                <th class="py-3 px-6 bg-gray-800 text-gray-600 font-semibold">Name</th>
                <th class="py-3 px-6 bg-gray-800 text-gray-600 font-semibold">Email</th>
                <th class="py-3 px-6 bg-gray-800 text-gray-600 font-semibold">Role</th>
                <th class="py-3 px-6 bg-gray-800 text-gray-600 font-semibold">Updated At</th>
                <th class="py-3 px-6 bg-gray-800 text-gray-600 font-semibold">Status</th>
                <th class="py-3 px-6 bg-gray-800 text-gray-600 font-semibold">Action</th>
            </tr>
        </thead>
        <tbody id="userTable">
            @foreach ($users as $user)
            <tr class="border-b text-center">
                <td class="py-3 px-6">00{{ $user->id }}</td>
                <td class="py-3 px-6">{{ $user->name }}</td>
                <td class="py-3 px-6">{{ $user->email }}</td>
                <td class="py-3 px-6 user-role">{{ $user->role }}</td>
                <td class="py-3 px-6">{{ $user->updated_at->diffForHumans() }}</td>
                <td class="py-3 px-6 text-white font-bold user-status
                    @if($user->status == 'active') bg-green-500
                    @elseif($user->status == 'inactive') bg-gray-500
                    @elseif($user->status == 'pending') bg-yellow-500
                    @elseif($user->status == 'deactivated') bg-red-500
                    @endif 
                    rounded-lg">
                    {{ ucfirst($user->status) }}
                </td>
                <td class="py-3 px-4">
                    <a href="{{ route('admin.users.edit', $user->id) }}" 
                    class="text-yellow-500 hover:text-yellow-600 mr-2 text-2xl" 
                    title="Edit User">
                        <i class="fas fa-edit"></i>
                    </a>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>

<script>
    function filterUsers() {
        let searchQuery = document.getElementById('searchInput').value.toLowerCase();
        let selectedRole = document.getElementById('roleFilter').value.toLowerCase();
        let selectedStatus = document.getElementById('statusFilter').value.toLowerCase();
        let rows = document.querySelectorAll("#userTable tr");

        rows.forEach(row => {
            let name = row.cells[1].textContent.toLowerCase();
            let email = row.cells[2].textContent.toLowerCase();
            let role = row.cells[3].textContent.toLowerCase();
            let status = row.cells[5].textContent.toLowerCase();

            let matchesSearch = name.includes(searchQuery) || email.includes(searchQuery);
            let matchesRole = selectedRole === "" || role === selectedRole;
            let matchesStatus = selectedStatus === "" || status === selectedStatus;

            row.style.display = matchesSearch && matchesRole && matchesStatus ? "" : "none";
        });
    }
</script>

@endsection
