Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tuz8O-0004WC-Lj
	for mharc-qemu-rust@gnu.org; Wed, 19 Mar 2025 15:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuz8M-0004Ul-WE
 for qemu-rust@nongnu.org; Wed, 19 Mar 2025 15:31:23 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuz8H-0005P7-4Y
 for qemu-rust@nongnu.org; Wed, 19 Mar 2025 15:31:22 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so76975e9.0
 for <qemu-rust@nongnu.org>; Wed, 19 Mar 2025 12:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742412675; x=1743017475; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qL1c+a1aNYoFYFU2SSF4d7BI0nk3Z2oqN48usIOFSqg=;
 b=g+n+Ki9WtKWbQif1hNmbma+Y7oZ2Pd6ppP8LZk6NMlDeEKLCjXMuIvJ3+8LEk8nqbF
 bwjLMETA8dyKhi1d6KCLfmlXlfsCu7hqevNDF2F9beleLCjHh3ynQ4sXAMuiFY/UP2zc
 ieFPVRFyfjSdeCHLzN7vacH7AflVVC7KteO2Cmx+rNela7pPwuN2Q3OaVO/q0jq/gEs/
 C1QklMCUgkIFwYx4R0J1uqm8mItFuGakb7IMbRlI7dZCrPMvBbAAZ0v+huWcvZxNgEkz
 xe3NCWNa8OTupqvIxzvxi8YMrXD6ovBQVlvP2oCAslRk58NRnCvWYyh3BVddK8YYp2Za
 LhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742412675; x=1743017475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qL1c+a1aNYoFYFU2SSF4d7BI0nk3Z2oqN48usIOFSqg=;
 b=h7/ht/63JwrsfEJPRUoCwyE2ia8OtxHiOdoR9wc/YX5jAqXYAAiXHtGaTS7YOja992
 rk+tpVxt+kaA/VIsQNETJc2/D+oT4M4FGNkiQSRBNmbN7VD1ETdWd4Xs+/qwSl2Cwee1
 vo7cts6pxZV+muZwfash7eHxEns0SigkIEhKvsyQIM6RfHZG3FkkAP8gh1mq8kKuEcCM
 Hrnc0vj00vnbk1bGS/Noesfe5Ueq4/bob836ZwZVoBBWkAzkMW6AoME5VAUMI3sqnFdK
 ml54bE9BLX2RA5dK20jrH5euKNmzQiVjkV8k81qZWREHd/2kqX4OPmvjLvpo9Ux5jVj6
 G7kg==
X-Gm-Message-State: AOJu0YyguTnfmvlsC494pVv6a9iuXMRufYtkw2KQaUOr03XOfBFbOppZ
 j459ichPd8/jsqDVUwyS8lIPaCWknh+zbZoLlvCk9XrM7WSZUjp8f+WmgeP2VAM=
X-Gm-Gg: ASbGncvD5yX+5WqvGDuS34GKmDUnIkDZ6BWSa8mlf3hKm1mEaJZ9OfeOElRpqguOoPv
 IiBnqR0oLBgfBzRFlTcgi+HR/+ZXRe94mJGpwhka8WhoFc/t+GuCy7WmFq4u8509SUDH4Y3qXik
 SiCp7MZl2sjJt8IwtF/6WLFcOaDIqtZmWCoPDdAaNEDNMeG0fmVH822+c3DSUGHb/bhItpG+KRK
 W6YGy1LoCDGF7vNAEs5OwML+DqHB6qxhRZU/LIf7szb948tDAM5VmeG6TvwC7jR44WWB2LFOS4h
 LBN0V6MDWt9D+MLlLo8oCXFkxsbuQGvBG0fOkwuPCMt8/XAfH8A=
X-Google-Smtp-Source: AGHT+IGohmmQ21Rn64s1b2RMtrWjikzy3KOX6i6Zl9TfjTUciT4jXXuFqGMwr4r+FpWau7XQzTXcXw==
X-Received: by 2002:a5d:47ca:0:b0:391:2f2f:818 with SMTP id
 ffacd0b85a97d-399739bbc6cmr3665462f8f.9.1742412675417; 
 Wed, 19 Mar 2025 12:31:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f47196sm26790495e9.16.2025.03.19.12.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 12:31:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Tanish Desai <tanishdesai37@gmail.com>
Subject: [PATCH 1/2] rust: Kconfig: Factor out whether PL011 is Rust or C
Date: Wed, 19 Mar 2025 19:31:09 +0000
Message-ID: <20250319193110.1565578-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319193110.1565578-1-peter.maydell@linaro.org>
References: <20250319193110.1565578-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
X-List-Received-Date: Wed, 19 Mar 2025 19:31:23 -0000

Currently every board that uses the PL011 duplicates the logic that
selects the Rust implementation if Rust was enabled and the C
implementation if it does not.  Factor this out into a separate
Kconfig stanza, so that boards can go back to simply doing "select
PL011" and get whichever implementation is correct for the build.

This fixes a compilation failure if CONFIG_VMAPPLE is enabled
in a Rust build, because hw/vmapple/Kconfig didn't have the
"pick the Rust PL011 if Rust is enabled" logic in it.

Fixes: 59f4d65584bd33 ("hw/vmapple/vmapple: Add vmapple machine type")
Reported-by: Tanish Desai <tanishdesai37@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig      | 30 ++++++++++--------------------
 hw/char/Kconfig     |  6 ++++++
 hw/char/meson.build |  2 +-
 3 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 15200a2d7e7..a55b44d7bde 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -21,8 +21,7 @@ config ARM_VIRT
     select PCI_EXPRESS
     select PCI_EXPRESS_GENERIC_BRIDGE
     select PFLASH_CFI01
-    select PL011 if !HAVE_RUST # UART
-    select X_PL011_RUST if HAVE_RUST # UART
+    select PL011 # UART
     select PL031 # RTC
     select PL061 # GPIO
     select GPIO_PWR
@@ -75,8 +74,7 @@ config HIGHBANK
     select AHCI_SYSBUS
     select ARM_TIMER # sp804
     select ARM_V7M
-    select PL011 if !HAVE_RUST # UART
-    select X_PL011_RUST if HAVE_RUST # UART
+    select PL011 # UART
     select PL022 # SPI
     select PL031 # RTC
     select PL061 # GPIO
@@ -89,8 +87,7 @@ config INTEGRATOR
     depends on TCG && ARM
     select ARM_TIMER
     select INTEGRATOR_DEBUG
-    select PL011 if !HAVE_RUST # UART
-    select X_PL011_RUST if HAVE_RUST # UART
+    select PL011 # UART
     select PL031 # RTC
     select PL041 # audio
     select PL050 # keyboard/mouse
@@ -108,8 +105,7 @@ config MUSCA
     default y
     depends on TCG && ARM
     select ARMSSE
-    select PL011 if !HAVE_RUST # UART
-    select X_PL011_RUST if HAVE_RUST # UART
+    select PL011 # UART
     select PL031
     select SPLIT_IRQ
     select UNIMP
@@ -173,8 +169,7 @@ config REALVIEW
     select WM8750 # audio codec
     select LSI_SCSI_PCI
     select PCI
-    select PL011 if !HAVE_RUST # UART
-    select X_PL011_RUST if HAVE_RUST # UART
+    select PL011 # UART
     select PL031  # RTC
     select PL041  # audio codec
     select PL050  # keyboard/mouse
@@ -199,8 +194,7 @@ config SBSA_REF
     select PCI_EXPRESS
     select PCI_EXPRESS_GENERIC_BRIDGE
     select PFLASH_CFI01
-    select PL011 if !HAVE_RUST # UART
-    select X_PL011_RUST if HAVE_RUST # UART
+    select PL011 # UART
     select PL031 # RTC
     select PL061 # GPIO
     select USB_XHCI_SYSBUS
@@ -224,8 +218,7 @@ config STELLARIS
     select ARM_V7M
     select CMSDK_APB_WATCHDOG
     select I2C
-    select PL011 if !HAVE_RUST # UART
-    select X_PL011_RUST if HAVE_RUST # UART
+    select PL011 # UART
     select PL022 # SPI
     select PL061 # GPIO
     select SSD0303 # OLED display
@@ -285,8 +278,7 @@ config VEXPRESS
     select ARM_TIMER # sp804
     select LAN9118
     select PFLASH_CFI01
-    select PL011 if !HAVE_RUST # UART
-    select X_PL011_RUST if HAVE_RUST # UART
+    select PL011 # UART
     select PL041 # audio codec
     select PL181  # display
     select REALVIEW
@@ -371,8 +363,7 @@ config RASPI
     default y
     depends on TCG && ARM
     select FRAMEBUFFER
-    select PL011 if !HAVE_RUST # UART
-    select X_PL011_RUST if HAVE_RUST # UART
+    select PL011 # UART
     select SDHCI
     select USB_DWC2
     select BCM2835_SPI
@@ -448,8 +439,7 @@ config XLNX_VERSAL
     select ARM_GIC
     select CPU_CLUSTER
     select DEVICE_TREE
-    select PL011 if !HAVE_RUST # UART
-    select X_PL011_RUST if HAVE_RUST # UART
+    select PL011 # UART
     select CADENCE
     select VIRTIO_MMIO
     select UNIMP
diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index 3f702565e67..9d517f3e287 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -11,6 +11,12 @@ config PARALLEL
 
 config PL011
     bool
+    # The PL011 has both a Rust and a C implementation
+    select PL011_C if !HAVE_RUST
+    select X_PL011_RUST if HAVE_RUST
+
+config PL011_C
+    bool
 
 config SERIAL
     bool
diff --git a/hw/char/meson.build b/hw/char/meson.build
index 86ee808cae7..4e439da8b9e 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -9,7 +9,7 @@ system_ss.add(when: 'CONFIG_ISA_BUS', if_true: files('parallel-isa.c'))
 system_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugcon.c'))
 system_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_uart.c'))
 system_ss.add(when: 'CONFIG_PARALLEL', if_true: files('parallel.c'))
-system_ss.add(when: 'CONFIG_PL011', if_true: files('pl011.c'))
+system_ss.add(when: 'CONFIG_PL011_C', if_true: files('pl011.c'))
 system_ss.add(when: 'CONFIG_SCLPCONSOLE', if_true: files('sclpconsole.c', 'sclpconsole-lm.c'))
 system_ss.add(when: 'CONFIG_SERIAL', if_true: files('serial.c'))
 system_ss.add(when: 'CONFIG_SERIAL_ISA', if_true: files('serial-isa.c'))
-- 
2.43.0


