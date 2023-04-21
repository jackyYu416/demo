# demo

## Introdution
這是一個計算輸入有幾個1的偵測電路，原本想做以前CIC contest的FFT電路，但該電路32bit輸出，我partition.pcf裡面我怎麼設定都會報錯，所以我才換題目!
## Block diagram

<img src="https://user-images.githubusercontent.com/117829285/233327992-0cf7e0bb-eaff-4c69-b135-84d6077f6a66.png" width="400">

## The schematics of FPGA_A and FPGA_B

- FPGA_A

<img src="https://user-images.githubusercontent.com/117829285/233331590-4f285acb-e6fb-4901-9136-f38459808058.png" width="400">

- FPGA_B

<img src="https://user-images.githubusercontent.com/117829285/233331958-fc7aaeb7-6025-44f4-907d-7d145ac3888c.png" width="400">

- timing report

<img src="https://user-images.githubusercontent.com/117829285/233599415-8f5fc844-7226-4f7c-b9ce-0f3eac25873b.png" width="400">

<img src="https://user-images.githubusercontent.com/117829285/233599601-1f8e6d49-f224-408e-ab95-1c8df639cf07.png" width="400">

<img src="https://user-images.githubusercontent.com/117829285/233599955-8c1d29f4-ccf3-4f9c-b354-25b35541178c.png" width="400">

<img src="https://user-images.githubusercontent.com/117829285/233600104-4d5fa337-8c4e-4a66-9f47-f66f99dff5fa.png" width="400">


