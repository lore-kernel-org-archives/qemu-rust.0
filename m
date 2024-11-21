Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEAeV-0001Yx-9W
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 12:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAdo-0000d8-Th
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 12:06:54 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAdU-0001eA-DR
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 12:06:52 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38231f84dccso801797f8f.1
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 09:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208790; x=1732813590; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eUF072RWHjw5X8nluQQuYebe1FYEMSwq9TSQiXId4cw=;
 b=RZEaBal/HgCez1sqSRKuaNDrAdBd5bYP0bDSdbj3qPg6Bm1A0NdeylB4W5LJhjmRuC
 GXKlmL3JaJzoP79RJyNRTo2ovvrfOXt7/TGJm3Id0XGs6tPWlXNPpNhYw3wZI4EwfYb7
 Kbu2KoXzL4MfF8lYI2FzcBgzwpG8PAnwXF4oUGJRTttIx1e18T+UIIxhj802k1X5FJG1
 hn309b7zSDeb+8VC4oGMaCRdyEIMlkQnlndFCBZcYVqy0cjbdPpW+GuqWtvXDnHF1Tij
 +plHVX+HQ8A2iTu8Nbdlep3fzbB6bHgkeXku5xVv8CHigeRlfgiCpdszouE/5y3pV5yl
 COOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208790; x=1732813590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eUF072RWHjw5X8nluQQuYebe1FYEMSwq9TSQiXId4cw=;
 b=iS9yhbO6Pay2Ey6kCQBdwv77LF6EDGQzVyUIYje3KgFsjZs9j6Ozrwp5dTlir8YteM
 hldflRz1acio3FksLyVO2pC4UbmdkM2m1ekIUvouP+Aqe3VNeZ//EMoLWS8SU1+eHcWz
 LQLSonInh81nSx+wBW5Iq4IZnE5nEkPRRHJ2rlsLIhd2fF4HRgkbJTErS5ZVRHpFK1F0
 EvHH6fdzGE8kZLhee+hKLH+G4q9O6t9JQUVCTeimdVm/ynIRNlhEryRSdB+55c28T3Rh
 ge+FVbZs4fsBKtUsJaVPW2CAJuGH60ARseHxiKJIaGMyr+gDVJxWRf9aDx6CgnGlF8Cy
 GspQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvEJL6IZ/Jvf0TivHEN2K0X1y2xXSQFgkQVtkf/0lykw0Tpy9b/r6sPkhjRPy8GxL6UwWRoE46nY8=@nongnu.org
X-Gm-Message-State: AOJu0YwHs5iNM59sgY+N7xev2qUY+tQ61zlpnP+QeRYwvWUDkMy7EyZS
 34XL5L8iwKAN1UY9r84TGGu4c77FQtwIa1wsIVAIjfuaIVZytxwDh0DB01Z2W88=
X-Gm-Gg: ASbGncsSl6NFbnJ0Pe5mIP3fI0gZqJ+wQwfe/BNCHF5YJK2y2sHIPwfDO9rMlXRZrgG
 hvPCh8x1rdNmZA5KYiUpOEEvat13jDvyIef6U04hhwf7AqwdreR/6k//fAzuRpEjkBLB4JW3jiZ
 3zivruioHAZ74rs8aFu31r+gj86h+XOGFMPyy0Cuw/VJ7Rg+UQSyiKNGU1nXh98jUerGsQWAXHO
 SlELEwUdzD+gn9zjzaLWvMAKA0fZvmL3zfmErNvLD7E1Ro0
X-Google-Smtp-Source: AGHT+IG9eDYI9v61rhFpKx5O93ckIOEQUAKMZZuXqqXI3hJSJZJmm/WgMV4q8iJbOd1I/kEwyWxryw==
X-Received: by 2002:a05:6000:1448:b0:382:4d54:2cd9 with SMTP id
 ffacd0b85a97d-38254ae84ccmr5912405f8f.20.1732208787183; 
 Thu, 21 Nov 2024 09:06:27 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fd0fbdcsm27306f8f.109.2024.11.21.09.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 09:06:25 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8231260443;
 Thu, 21 Nov 2024 16:58:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-s390x@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Markus Armbruster <armbru@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 23/39] tests/functional: add a m68k tuxrun tests
Date: Thu, 21 Nov 2024 16:57:50 +0000
Message-Id: <20241121165806.476008-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Thu, 21 Nov 2024 17:06:57 -0000

We didn't have this before and as it exercises the m68k virt platform
it seems worth adding. We don't wait for the shutdown because QEMU
will auto-exit on the shutdown.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Anders Roxell <anders.roxell@linaro.org>
---
 tests/functional/meson.build         |  1 +
 tests/functional/test_m68k_tuxrun.py | 34 ++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 tests/functional/test_m68k_tuxrun.py

diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 923f9e7078..3ce969066c 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -95,6 +95,7 @@ tests_m68k_system_thorough = [
   'm68k_mcf5208evb',
   'm68k_nextcube',
   'm68k_q800',
+  'm68k_tuxrun',
 ]
 
 tests_microblaze_system_thorough = [
diff --git a/tests/functional/test_m68k_tuxrun.py b/tests/functional/test_m68k_tuxrun.py
new file mode 100644
index 0000000000..7eacba135f
--- /dev/null
+++ b/tests/functional/test_m68k_tuxrun.py
@@ -0,0 +1,34 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots known good tuxboot images the same way
+# that tuxrun (www.tuxrun.org) does. This tool is used by things like
+# the LKFT project to run regression tests on kernels.
+#
+# Copyright (c) 2024 Linaro Ltd.
+#
+# Author:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import Asset
+from qemu_test.tuxruntest import TuxRunBaselineTest
+
+class TuxRunM68KTest(TuxRunBaselineTest):
+
+    ASSET_M68K_KERNEL = Asset(
+        'https://storage.tuxboot.com/buildroot/20241119/m68k/vmlinux',
+        '7754e1d5cec753ccf1dc6894729a7f54c1a4965631ebf56df8e4ce1163ad19d8')
+    ASSET_M68K_ROOTFS = Asset(
+        'https://storage.tuxboot.com/buildroot/20241119/m68k/rootfs.ext4.zst',
+        '557962ffff265607912e82232cf21adbe0e4e5a88e1e1d411ce848c37f0213e9')
+
+    def test_m68k(self):
+        self.set_machine('virt')
+        self.cpu="m68040"
+        self.common_tuxrun(kernel_asset=self.ASSET_M68K_KERNEL,
+                           rootfs_asset=self.ASSET_M68K_ROOTFS,
+                           drive="virtio-blk-device")
+
+if __name__ == '__main__':
+    TuxRunBaselineTest.main()
-- 
2.39.5


