/* Gather Teleport Buttons – Desktop App */
(() => {
    const TARGETS = [
      { label: "My Desk", x: 23, y: 49 },
      { label: "PM11", x: 53, y: 53 },
      { label: "Garage", x: 54, y: 41},
      { label: "Camp Space", x: 29, y: 47}
    ];
  
    const wait = setInterval(() => {
      if (!window.game?.getMyPlayer) return;
      clearInterval(wait);
  
      const box = document.createElement("div");
      box.style = `
        position:fixed; bottom:0; left:50%; transform: translateX(-50%); z-index:9999;
        display:flex; gap:10px; backdrop-filter:blur(10px); padding: 8px;
        border-radius: 10px;
      `;
  
      const style = document.createElement("style");
      style.textContent = `
        .tp-btn{
          padding:8px 16px;border-radius:8px;font:14px/1 "Segoe UI",sans-serif;
          background:rgba(255,255,255,.12);border:1px solid rgba(255,255,255,.25);
          color:#fff;cursor:pointer;transition:.2s background,.1s transform;
        }
        .tp-btn:hover{background:rgba(255,255,255,.25);transform:scale(1.05);}
        .tp-btn:active{transform:scale(.95);}
      `;
      document.head.appendChild(style);
  
      TARGETS.forEach(({ label, x, y }) => {
        const b = document.createElement("button");
        b.className = "tp-btn"; b.textContent = label;
        b.onclick   = () => {
          const mapId = window.game.getMyPlayer().map;
          window.game.teleport(mapId, x, y); // ← 核心呼び出し
        };
        box.appendChild(b);
      });
      document.getElementById("root")?.appendChild(box);
    }, 500);
  })();