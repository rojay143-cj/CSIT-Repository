@if (session()->has('success') || session()->has('error'))
<div id="statusModal" class="fixed top-0 left-0 w-full h-full bg-[#1A193D] bg-opacity-50 z-50 flex justify-center items-center">
    @if(session()->has('error'))
    <div class="bg-[#1A193D] rounded-3xl py-10 px-6 w-full max-w-md mx-4 tablet:max-w-lg relative">
        <div class="absolute top-4 right-6 cursor-pointer close-modal">
            <i class="fa-solid fa-xmark text-4xl text-gray-300"></i>
        </div>
        <div class="p-5 flex justify-center items-center w-[30%] mx-auto">
            <img src="{{ asset('asset/image/error_image/error.gif') }}" alt="Success Image" class="w-full h-full object-contain">
        </div>
        <div class="text-white font-semibold text-center">
            <h5 class="text-xl md:text-2xl lg:text-3xl mb-3">Error</h5>
            <p class="text-sm md:text-base lg:text-lg opacity-80 mt-5">
                {{ session('error') }}
            </p>
        </div>
    </div>
    @endif

    @if(session()->has('success'))
    <div class="bg-[#1A193D] rounded-3xl py-10 px-6 w-full max-w-md mx-4 tablet:max-w-lg relative">
        <div class="absolute top-4 right-6 cursor-pointer close-modal">
            <i class="fa-solid fa-xmark text-4xl text-gray-300"></i>
        </div>
        <div class="p-5 flex justify-center items-center relative w-[30%] mx-auto">
            <img src="{{ asset('asset/image/error_image/success.gif') }}" alt="Success Image" class="w-full h-full object-contain">
        </div>
        <div class="text-white font-semibold text-center">
            <h5 class="text-xl md:text-2xl lg:text-3xl mb-3">Success</h5>
            <p class="text-sm md:text-base lg:text-lg opacity-80 mt-5">
                {{ session('success') }}
            </p>
        </div>
    </div>
    @endif
</div>
@endif
<script>
    document.querySelector('.close-modal').addEventListener('click', () => {
        document.getElementById('statusModal').style.display = 'none';
    });
</script>