#include <cmath>
void drawD2D(ID2D1HwndRenderTarget* renderTarget) {
    static double step = 0;
    renderTarget->BeginDraw();
    renderTarget->Clear(D2D1::ColorF(D2D1::ColorF::Black));
    ID2D1SolidColorBrush* brush = nullptr;
    renderTarget->CreateSolidColorBrush(
        D2D1::ColorF(D2D1::ColorF::White), &brush);
    renderTarget->DrawRectangle(
        D2D1::RectF(100.0f, 100.0f, 300.0f, 300.0f),
        brush, 5.0f);
    renderTarget->FillEllipse(
        D2D1::Ellipse(D2D1::Point2F(
            500.0f + std::sin(step / 100.0) * 100,
            200.0f + std::cos(step / 80.0) * 200),
            100.0f, 100.0f), brush);
    if (brush) brush->Release();
    renderTarget->EndDraw();
    step++;
}

int WINAPI WinMain(_In_ HINSTANCE, _In_opt_ HINSTANCE,
                   _In_ LPSTR, _In_ int){
    MyWindow myWindow;
    MyD2D myD2D(myWindow.getHwnd());

    while(myWindow.step()) {
        drawD2D(myD2D.getRenderTarget());
    }
    return 0;
}
