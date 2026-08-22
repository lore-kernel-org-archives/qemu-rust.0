Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C643DC5DF8C
	for <qemu-rust@archiver.kernel.org>; Sat, 22 Aug 2026 16:56:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wxozm-0002fi-AS; Sat, 22 Aug 2026 12:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wxozk-0002et-Vi
 for qemu-rust@nongnu.org; Sat, 22 Aug 2026 12:55:00 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wxozj-0006gz-5H
 for qemu-rust@nongnu.org; Sat, 22 Aug 2026 12:55:00 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-8520161fdb9so1645776b3a.3
 for <qemu-rust@nongnu.org>; Sat, 22 Aug 2026 09:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787417698; x=1788022498; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=f2PQRSPvPljDWMrjBTrlNl9RDQbiYdM8LPCBein4cVY=;
 b=QZVXuG4BwPnAw+5cM6VpKSqWGp+sZWqZI04Nx/4ndL0DfYUie3QZnI1e35phC1LKWx
 vgb500j0burunPScTy2zHfiyTcKvpAtJla0jMKswz6e+qu4+hrrBV8u029VkAhbrdBfx
 borJF0/lpsVqtW778acTiCk1zGN9vLw5f81zbwRuAULi/6aapDa5Qz7tSzPWi1r/wLyV
 tQDUsnZOCGgUUqNuup3kDUiVCWHdVVW46iqMGroe3qtabq0enBrqXkdgV69VwSwYSJeQ
 nUTsmjXLxAxqIrmLuIsuZ5H4xvYcJLfkWBllVzFjHPM7LhMDE3Zf3snrOyiRn9mUZWZg
 WH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787417698; x=1788022498;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=f2PQRSPvPljDWMrjBTrlNl9RDQbiYdM8LPCBein4cVY=;
 b=mpA5cBiXIQRQ/61+nOZs35imZR4cpZGOjSDvraCtP57aUq2kLziAiGT/mUxUR2mj8P
 C3Mb/tfWBmB6ht+8kh1uIkcl/SkjRAd4pfeATRTZpuceAwpxRnkC6EpQDQLNJRhzMY47
 RwmU9Cv1V7xMsL30oUXtKpr7x6ooaw9c9/Lkn0KA/DR3H5NSdLX3kwS+DuxINvGFaLpo
 ndyJmK61+GADLYP7DmqWxbjjOaYctqaW6/bckIQlYdK+VLn4dYz/6BXdhE3aJesA0V3K
 JVdvk0Ou17s0Meo2ZWWNgg+E3Q1IQyjC8fekSQy3Oq1JaVTtjoNcVuNVlRI4/1WsGEPO
 P5+w==
X-Forwarded-Encrypted: i=1;
 AHgh+RoSLL8mDzVUJN4T7AH2PMCmE1R86+9FtRVvcXG77RR6PnhINIgc/vgGfFtOvHYpErYX4v+Ry3K2/Rg=@nongnu.org
X-Gm-Message-State: AFuF++mE2tMzV2XVzB0X4JXR8LpWhKjtvHgAp3qsnUdiVazLDdyQCbdz
 ++ekHUiB/SFA7BeRcogjIN5P0n5X2PpFvOo4AAll96SeHEidoMMxG0vy
X-Gm-Gg: AR+sD13Io86SPWF4KkL11roKSWo5MQAR4F20lbqlMTdrjEwrCg9gDCKXztA/1XltXSo
 tFrLqpoZ1eoWZtIYq7Gl+P9r0bZ7xfeFFRfHvTY6X/Hxo4vsCUkDsh4Y0Ev/4mrYLmKV3Uc/oYv
 ooPdzwO8NjB09FGRxbr2+557VXdzLOscCTMTIhXbeW10XDWYGjC5EFPebd0wKQrCWIeGsFg9lY+
 asSSSgAmMlEDbsEFBLTwFINKfPRZ3dkTJq4NCe5h4VBRWtJBAAUtYR1k7U1h3WR2/E2T4c3JdZO
 C/uhgJJqJpDWuuZGOzyApyZ/H839IAjdo5Zjw/WHY/D9OOIROcb3nllC/TmsoNAmLAwOlaaJDUa
 lB6LNFcSNECpaokxjXd+MFHB/ScmJgBoVxsg2Ewq5EPkhZ2FOiqbMrnIP9a6UMdkAVrA6DbYDpS
 kl30ogWV3mlQfQHTCqWLaHfzq8gSJY+o3eKFGKcn3vNYfKuGWIRp7kTaOfUdkj5luYuYtXSR8Fe
 F3rDi+ZMntovesAmb4Qlcud76FtJef+hYLBMlIcZKq68haPPi+baRyKJn+8bBJmMZFqrDS4zJQy
 Z+hBuw==
X-Received: by 2002:a05:6a20:e607:b0:3c3:89ce:b5bc with SMTP id
 adf61e73a8af0-3cd3009a920mr29213877637.15.1787417697631; 
 Sat, 22 Aug 2026 09:54:57 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([117.55.237.216]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-327f91d2d1esm8688456eec.17.2026.08.22.09.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2026 09:54:57 -0700 (PDT)
From: Jack Wang <163wangjack@gmail.com>
Date: Sun, 23 Aug 2026 00:54:37 +0800
Subject: [PATCH RFC v2 3/5] hw/arm/stm32f100: instantiate and map GPIO
 ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-stm32f100-gpio-v2-final-v2-3-02e31f589dd0@gmail.com>
References: <20260823-stm32f100-gpio-v2-final-v2-0-02e31f589dd0@gmail.com>
In-Reply-To: <20260823-stm32f100-gpio-v2-final-v2-0-02e31f589dd0@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Alexandre Iooss <erdnaxe@crans.org>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4850; i=163wangjack@gmail.com; 
 h=from:subject:message-id;
 bh=mP8WffifX+6XqQ5W3gSIX1W/Wm1uvmeNzY6B0uMYAJU=; 
 b=owEBiQJ2/ZANAwAIARVa4Yx0u1BNAcsmYgBqidRSayA+zoSRZzV3j4TyFdxMtwn3h765CkFZe
 CaYvxiUPuyJAk8EAAEIADkWIQQlXkw4qdbVYyKFm20VWuGMdLtQTQUCaonUUhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDMACgkQFVrhjHS7UE2UQBAAks/cuHe+IXUf/WsS0uPcqT3N0kb5YM/
 jTZm4/PPWP5wWqfma8SXrkDWuhS5pR6RJJSTWDQcwwM71xg+YkGyihLQGhfpap8R0sR81fiva5Z
 T+3sRJydN4tywr2oG4ahynnKf+kHoBU4ReJzgu0Z81hNzzZ9L8ctxuZhVdNFdiMUG/+OCpb4A6f
 4oAN9HFXI+MroH36VS/cfkqYrPxgFo23D1ohyYendUpK5hYhlaXJqt3uPBgsfEjID7B1+kWfveD
 9vRFEoxDBjwEk83m+D8kIthJePGYrTtNquyYWQ4b9DUHVvSzpcDUEmO5QOM5FIDx0XDYqrT1D4p
 w6IFF36FWE1AXgSdgJhbcN7yx204VkizdPSyXIF+479mgtX0/c/8I9LFZqPW324HkHH4yQVmTmv
 wVHpSOFkO/tIS0CIE4yAnOJv0bVZtKhKzHwSY1vOG8hAeJlxe08J/hBujz07Oyy51Ky1lkO1dnZ
 I5MmxV8rljSAIh2lB2aI51vM9cx88gA8SPv2z5VJwNW/IelM9Fi6KeXQXzNjwcFx3w2Syzu4+rJ
 tJSTRfYx9nfTezU7ePiJW2M/Y/0mOefjsuWm2BnH8U/dBpfR87l432v8O4R8Ewat19BEcNSyV5F
 CU4mRibBeBrJzzyPDW9v0uI4hBK2iZYxt3ZLRS5fXnzjXx/v9I4g=
X-Developer-Key: i=163wangjack@gmail.com; a=openpgp;
 fpr=255E4C38A9D6D56322859B6D155AE18C74BB504D
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=163wangjack@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

Instantiate the Rust STM32F1xx GPIO device for GPIOA through GPIOE on the STM32F100RBT6 used by the stm32vldiscovery machine.

Use a fixed-size address table tied to STM32F100_NUM_GPIOS. When the Rust type is unavailable, retain the existing unimplemented-device regions so a --disable-rust build does not leave the GPIO windows unbacked.

Do not connect the GPIO ports directly to the NVIC because external interrupts are routed through the currently unmodelled EXTI.

Signed-off-by: Jack Wang <163wangjack@gmail.com>
---
 hw/arm/Kconfig                 |  1 +
 hw/arm/stm32f100_soc.c         | 35 ++++++++++++++++++++++++++++++-----
 include/hw/arm/stm32f100_soc.h |  2 ++
 3 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 260d2f0751..6333c0ca09 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -373,6 +373,7 @@ config STM32F100_SOC
     select ARM_V7M
     select STM32F2XX_USART
     select STM32F2XX_SPI
+    select STM32F1XX_GPIO if HAVE_RUST
 
 config STM32F205_SOC
     bool
diff --git a/hw/arm/stm32f100_soc.c b/hw/arm/stm32f100_soc.c
index 2358368dba..769f8e5ff0 100644
--- a/hw/arm/stm32f100_soc.c
+++ b/hw/arm/stm32f100_soc.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 #include "hw/arm/boot.h"
 #include "system/address-spaces.h"
 #include "hw/arm/stm32f100_soc.h"
@@ -36,10 +37,20 @@
 
 /* stm32f100_soc implementation is derived from stm32f205_soc */
 
+#define TYPE_STM32F1XX_GPIO_RUST "stm32f1xx-gpio-rust"
+
 static const uint32_t usart_addr[STM_NUM_USARTS] = { 0x40013800, 0x40004400,
     0x40004800 };
 static const uint32_t spi_addr[STM_NUM_SPIS] = { 0x40013000, 0x40003800 };
 
+static const uint32_t gpio_addr[STM32F100_NUM_GPIOS] = {
+    0x40010800, 0x40010c00, 0x40011000, 0x40011400, 0x40011800,
+};
+
+static const char *const gpio_name[STM32F100_NUM_GPIOS] = {
+    "GPIOA", "GPIOB", "GPIOC", "GPIOD", "GPIOE",
+};
+
 static const int usart_irq[STM_NUM_USARTS] = {37, 38, 39};
 static const int spi_irq[STM_NUM_SPIS] = {35, 36};
 
@@ -149,6 +160,25 @@ static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
         sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, spi_irq[i]));
     }
 
+    /* GPIO interrupts are routed through the currently unmodelled EXTI. */
+    if (object_class_by_name(TYPE_STM32F1XX_GPIO_RUST)) {
+        for (i = 0; i < STM32F100_NUM_GPIOS; i++) {
+            g_autofree char *name = g_strdup_printf("gpio%c", 'a' + i);
+
+            s->gpio[i] = qdev_new(TYPE_STM32F1XX_GPIO_RUST);
+            object_property_add_child(OBJECT(s), name, OBJECT(s->gpio[i]));
+            busdev = SYS_BUS_DEVICE(s->gpio[i]);
+            if (!sysbus_realize_and_unref(busdev, errp)) {
+                return;
+            }
+            sysbus_mmio_map(busdev, 0, gpio_addr[i]);
+        }
+    } else {
+        for (i = 0; i < STM32F100_NUM_GPIOS; i++) {
+            create_unimplemented_device(gpio_name[i], gpio_addr[i], 0x400);
+        }
+    }
+
     create_unimplemented_device("timer[2]",  0x40000000, 0x400);
     create_unimplemented_device("timer[3]",  0x40000400, 0x400);
     create_unimplemented_device("timer[4]",  0x40000800, 0x400);
@@ -165,11 +195,6 @@ static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
     create_unimplemented_device("CEC",       0x40007800, 0x400);
     create_unimplemented_device("AFIO",      0x40010000, 0x400);
     create_unimplemented_device("EXTI",      0x40010400, 0x400);
-    create_unimplemented_device("GPIOA",     0x40010800, 0x400);
-    create_unimplemented_device("GPIOB",     0x40010C00, 0x400);
-    create_unimplemented_device("GPIOC",     0x40011000, 0x400);
-    create_unimplemented_device("GPIOD",     0x40011400, 0x400);
-    create_unimplemented_device("GPIOE",     0x40011800, 0x400);
     create_unimplemented_device("ADC1",      0x40012400, 0x400);
     create_unimplemented_device("timer[1]",  0x40012C00, 0x400);
     create_unimplemented_device("timer[15]", 0x40014000, 0x400);
diff --git a/include/hw/arm/stm32f100_soc.h b/include/hw/arm/stm32f100_soc.h
index 4c113d6774..401794242d 100644
--- a/include/hw/arm/stm32f100_soc.h
+++ b/include/hw/arm/stm32f100_soc.h
@@ -36,6 +36,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(STM32F100State, STM32F100_SOC)
 
 #define STM_NUM_USARTS 3
 #define STM_NUM_SPIS 2
+#define STM32F100_NUM_GPIOS 5
 
 #define FLASH_BASE_ADDRESS 0x08000000
 #define FLASH_SIZE (128 * 1024)
@@ -49,6 +50,7 @@ struct STM32F100State {
 
     STM32F2XXUsartState usart[STM_NUM_USARTS];
     STM32F2XXSPIState spi[STM_NUM_SPIS];
+    DeviceState *gpio[STM32F100_NUM_GPIOS];
 
     MemoryRegion sram;
     MemoryRegion flash;

-- 
2.53.0


