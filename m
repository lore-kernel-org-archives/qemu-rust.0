Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uCwdt-0001Uq-Lh
	for mharc-qemu-rust@gnu.org; Thu, 08 May 2025 04:30:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uCwde-0001Nr-VR
 for qemu-rust@nongnu.org; Thu, 08 May 2025 04:29:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uCwdb-0008D8-VM
 for qemu-rust@nongnu.org; Thu, 08 May 2025 04:29:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746692990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CgVmgTmeCyafdTkrLAjxXKPoGVFjbr8Uvw8ZenJ36pI=;
 b=VwsxkfBY2cU9o55Cgd2KcP75Xi2y2s6J4dI4kH2ml0lLOlnPxfSPfgDwY+/LNMyQNl7HYC
 QwBhZMz1hfCewZ3Vk/S4BoeB+Guv6lo+wl+bVcRjha9U0J44N4NaM+fmefICUTC6KFz9EF
 4JeVKI1YxuCmXOuOzxhWEsBAo13Q1x8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221--dNCBKAXOzaVXOh6OhZ_lQ-1; Thu, 08 May 2025 04:29:48 -0400
X-MC-Unique: -dNCBKAXOzaVXOh6OhZ_lQ-1
X-Mimecast-MFC-AGG-ID: -dNCBKAXOzaVXOh6OhZ_lQ_1746692988
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43d5ca7c86aso3857805e9.0
 for <qemu-rust@nongnu.org>; Thu, 08 May 2025 01:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746692987; x=1747297787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CgVmgTmeCyafdTkrLAjxXKPoGVFjbr8Uvw8ZenJ36pI=;
 b=pRZIR9/Aobid2WMhoRF0G3774uEuV7BPKVui1P3rq3E63rv9/zwv7QCuHcicw787yt
 6CnOeN0kg/ZXO7y0e0hrIqRfNQny81n7+PRd31WlSbt0GDYpoqp+Lxw3aawRBPB5Jxtt
 Hcje2s/kf7IUVP17cV1hX9cYeqbHot4gUlMHh8IF3IiTrI42P2YOdZRn4ksK5VdDMpli
 4XCLB3x+VSKHwBPnnD3+pQsqSSdJZuud6LYxB0IvIMXOYWznYlJH8/4TcGpKUmdQQiNl
 cUoQ5LTL5LzYeZExXrAujvwvHPEY0uqqKW63RUgWOj236PccLYDFWQnTufzNcwd6c6UM
 ruBQ==
X-Gm-Message-State: AOJu0YxmY3fUynU0tTTrkkSJ/c5ofRcTmXmpwSN8WvlkCLtzrHTGot30
 4TTmZt1EjDJsFjLTac+f+Po8rWpLXW+c1ONGOv6HTHj9cKlEKm7M0x4hnzHHAgfqSmMK3ULYe8j
 dENnZiCZ+uUAM7lVAfqlycwKqZR6b/MkZWTOtdLOr4e7IQyyvTuwRbaMN7EA=
X-Gm-Gg: ASbGncuUD4QUjbv9XYRaTgURDOdyMs8axToGrEmyACvhnyABvFdIusZRdyG4da0Lewh
 kItCW0rHARGkyN+FIFV6sv6i0RGbWBNjgQ3+/yfoxkDQ2jUywo3jE5b7II+NKtgs4t3S+E5Op5N
 RkYarwtLwGOf+/UJNBFo7vxBxUaaPs3ocIajktFjA5pBpx6v28Z6hFSOx2FmyP7JGGBkEWt+3pG
 j8+Skr7GvzGo3iARun6UHRtPyxQN8l/eADgUgz7U2euNtn41S8o3yykGVD6O3P4F5prBCw2JV40
 R7Bb9HijzTcGLAY=
X-Received: by 2002:a05:600c:35d3:b0:441:d437:ed19 with SMTP id
 5b1f17b1804b1-441d44c4457mr46435155e9.11.1746692987370; 
 Thu, 08 May 2025 01:29:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8lSGqKWZFXvAOr2WtLaLhg1mNzcPEWn2u4Lvw9DY1hoprSfL/aKo4xymOQcaB6S4grOebBA==
X-Received: by 2002:a05:600c:35d3:b0:441:d437:ed19 with SMTP id
 5b1f17b1804b1-441d44c4457mr46434895e9.11.1746692986976; 
 Thu, 08 May 2025 01:29:46 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3810c7sm28200135e9.38.2025.05.08.01.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 01:29:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 1/2] rust: pl011: Rename RX FIFO methods
Date: Thu,  8 May 2025 10:29:42 +0200
Message-ID: <20250508082943.446512-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508082943.446512-1-pbonzini@redhat.com>
References: <20250508082943.446512-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VZ5XZfOmkNkvsGl1wfwcPhQMKHXCO5fokPjXpFK1hpM_1746692988
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 08 May 2025 08:29:58 -0000

In preparation of having a TX FIFO, rename the RX FIFO methods.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 7c563ade9cd..94b31659849 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -329,7 +329,7 @@ fn loopback_tx(&mut self, value: registers::Data) -> bool {
         // hardware flow-control is enabled.
         //
         // For simplicity, the above described is not emulated.
-        self.loopback_enabled() && self.put_fifo(value)
+        self.loopback_enabled() && self.fifo_rx_put(value)
     }
 
     #[must_use]
@@ -439,7 +439,7 @@ pub fn fifo_depth(&self) -> u32 {
     }
 
     #[must_use]
-    pub fn put_fifo(&mut self, value: registers::Data) -> bool {
+    pub fn fifo_rx_put(&mut self, value: registers::Data) -> bool {
         let depth = self.fifo_depth();
         assert!(depth > 0);
         let slot = (self.read_pos + self.read_count) & (depth - 1);
@@ -589,7 +589,7 @@ fn receive(&self, buf: &[u8]) {
         }
         let mut regs = self.regs.borrow_mut();
         let c: u32 = buf[0].into();
-        let update_irq = !regs.loopback_enabled() && regs.put_fifo(c.into());
+        let update_irq = !regs.loopback_enabled() && regs.fifo_rx_put(c.into());
         // Release the BqlRefCell before calling self.update()
         drop(regs);
 
@@ -602,7 +602,7 @@ fn event(&self, event: Event) {
         let mut update_irq = false;
         let mut regs = self.regs.borrow_mut();
         if event == Event::CHR_EVENT_BREAK && !regs.loopback_enabled() {
-            update_irq = regs.put_fifo(registers::Data::BREAK);
+            update_irq = regs.fifo_rx_put(registers::Data::BREAK);
         }
         // Release the BqlRefCell before calling self.update()
         drop(regs);
-- 
2.49.0


