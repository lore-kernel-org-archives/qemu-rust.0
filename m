Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tqcwQ-0001UN-JO
	for mharc-qemu-rust@gnu.org; Fri, 07 Mar 2025 14:01:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqcwK-0001Sr-Vd
 for qemu-rust@nongnu.org; Fri, 07 Mar 2025 14:00:57 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqcwJ-0001Fg-H7
 for qemu-rust@nongnu.org; Fri, 07 Mar 2025 14:00:56 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so13082485e9.0
 for <qemu-rust@nongnu.org>; Fri, 07 Mar 2025 11:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741374053; x=1741978853; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+ov10O5xJ0eWfryJceZIMZwtAJQT4LfG+/G3LlkHNLc=;
 b=FCxTZz7SFMo7yvbl8hhLP1N3TajhIKMfjPb49eHNopwsx0hVl5+dTJLFHdErGohrV2
 5LIyh6kmlWi13g9pxRfUUeg4La/zHPJ6sUQQTG4fEemUY01U6aiIdOn/331YSbnoIY71
 3wSheb6dzllMdvwgkqKyGUb/UhwBxmOdFFIFNzjU0dq8s2oVxBOvRVEqe7y17BZuGnUp
 dmQ+8FBvB9m2v7LOkaUVfGvQvsYBqLZROT2ryrAXqlBjezwg0Xca17TcdL/Q53KHG28M
 m7qcsw/Q484nLloSRx4T9a67nJB9xqPC/GkbhrJqaTJKtT2wWXLRll72+75ymSI/6FsR
 CGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741374053; x=1741978853;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+ov10O5xJ0eWfryJceZIMZwtAJQT4LfG+/G3LlkHNLc=;
 b=sJzdn2TGiCfRBFdZGNNtJK09ySDYWNCVlLJ1cIxkRR6Fwop022d3Y98faICrkW7gEV
 XmTne+PFrvt3VQfq6XfHw/psvx6Vj4U5z4+SiN72O928hGyEiCKzbXDg6XFl7d780wPc
 e1hByCqGCtYdkDRiyG82k4m7baqd0wUISLgk2eXCdmJqE12JaUsFDt0stvMLSKLQCeuq
 kmxp3XOGt5OB+TCNvlvbQJihwui3j/gNUB7niAKJmUEHAdzSMZwFU+bZfWe8LgtIOInS
 Dvl3dFegwSjRdfyyNzsXg4wrbyeh+QS0nKkQ5gYtorngpuK7yxVuTpnODNmZARSB4BSn
 /cDw==
X-Gm-Message-State: AOJu0Yy0TSS4zUgZp7yEFIgzNnHCx9kMFYi1uwyAX21CJOFsbfZbD1qZ
 OJDrekXm3a1jJB9G8X+iVkAVKjxY2Fyo86LHMIEWFxLR/WCWj2J/SzXOdIMfnjU=
X-Gm-Gg: ASbGncvICrxqhnvdQWnIlCQ8lKFlPJe1nP52hqCahwGWDPB0Nendm86mE9KoKhrtx3G
 lxFDQr9Qf0UC0K5LY98VUVP03gTqv5xZDDqdz1jXqW/jX/t9fPg21v5Evc1kUY3tgnIE+xceWKq
 Fzo0U6Ni55EPVdB40smdXeM86qFIPUM7t+B2noE06ue3sCbZOlWzGFFdEPFqi9BryI8m9EhpR9r
 a3+PAbiwUX5gv1VxIzHNnXXytTGPV/f4jbh2Uj+watmzlBVtcc1S2/tb+HAEgkJeGvn28TthEbr
 uV6kDLqKRx1+ZJMF7IPVoQNgOQGvDa1MUU9Rm1xGELI1KBpjGiA=
X-Google-Smtp-Source: AGHT+IHUtqLHeofBpGNp4lhvKCSdp/4teFVcM8y0kf9G06pVKZE2dh5JQYZ+FQCvLyjEOrTugGG4Jg==
X-Received: by 2002:a05:6000:402a:b0:390:f6be:9a3d with SMTP id
 ffacd0b85a97d-39132dc5627mr4175296f8f.35.1741374053458; 
 Fri, 07 Mar 2025 11:00:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e2eafsm6357147f8f.68.2025.03.07.11.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 11:00:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] rust: pl011: Allow NULL chardev argument to pl011_create()
Date: Fri,  7 Mar 2025 19:00:51 +0000
Message-ID: <20250307190051.3274226-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 07 Mar 2025 19:00:59 -0000

It's valid for the caller to pass a NULL chardev to pl011_create();
this means "don't set the chardev property on the device", which
in turn means "act like there's no chardev". All the chardev
frontend APIs (in C, at least) accept a NULL pointer to mean
"do nothing".

This fixes some failures in 'make check-functional' when Rust support
is enabled.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is my first Rust related patch for QEMU, so I've
probably got something wrong here :-)
---
 rust/hw/char/pl011/src/device.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index d0857b470c9..8098f762f4b 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -713,10 +713,12 @@ pub fn post_load(&self, _version_id: u32) -> Result<(), ()> {
     // SAFETY: The callers promise that they have owned references.
     // They do not gift them to pl011_create, so use `Owned::from`.
     let irq = unsafe { Owned::<IRQState>::from(&*irq) };
-    let chr = unsafe { Owned::<Chardev>::from(&*chr) };
 
     let dev = PL011State::new();
-    dev.prop_set_chr("chardev", &chr);
+    if !chr.is_null() {
+        let chr = unsafe { Owned::<Chardev>::from(&*chr) };
+        dev.prop_set_chr("chardev", &chr);
+    }
     dev.sysbus_realize();
     dev.mmio_map(0, addr);
     dev.connect_irq(0, &irq);
-- 
2.43.0


