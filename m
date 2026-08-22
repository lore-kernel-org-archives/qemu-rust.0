Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6462C5DF97
	for <qemu-rust@archiver.kernel.org>; Sat, 22 Aug 2026 16:55:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wxozl-0002fE-MZ; Sat, 22 Aug 2026 12:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wxozk-0002ek-DM
 for qemu-rust@nongnu.org; Sat, 22 Aug 2026 12:55:00 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wxozi-0006gn-Fd
 for qemu-rust@nongnu.org; Sat, 22 Aug 2026 12:55:00 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-ca766c1c9ccso1441220a12.0
 for <qemu-rust@nongnu.org>; Sat, 22 Aug 2026 09:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787417694; x=1788022494; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mhEU6aF3+QjuNaMTF/g3TcPOXmaDcXqZHgRUc5HuoC0=;
 b=hwy9NsdfegxBy7R1NPBnPpWsDPwjQhEjZND8Dy0/OD19zC6qFoOCAuUWI5su5p04f7
 XiZ6p3JxMhLxCckinzahYlH4KuRrEaxS76IKVg6HtHcMcydH+9Lf/lrSX7QQckb4dD8B
 Zav9a7/Rfs5xURbsdqU1QLR2K0QQDeii42otjWk9DOP1nrIuwYXr11zwk3MaSE0MoyaP
 +97SnktsdFPFot8arLfWuHsX2BUU0yeWTtytAcCdlEeCFAZ0SZyMfjyTN3OZ1yE0m0yy
 2tGna+Jbw5w4Ev5TcFSfj7i7kd/qTB101ZN3XG9NbRuPyhoFAw1cl2vmhLq+CgCVPBvX
 rHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787417694; x=1788022494;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mhEU6aF3+QjuNaMTF/g3TcPOXmaDcXqZHgRUc5HuoC0=;
 b=Z4KHZghiqvGMFip4bmSnVSa7IblOk013Tq2J7HsUH0XUXmTsutNRsot8D+Z/oQAX22
 g6xntU4J2uSttEFSAAEZ5S6p+H3Eb1USRhTjgtWXNRj+sFH5vDXnkLb9D5YExlTVTnTq
 qglmxc+xEMJIoJregC2yqZON6aesdoxlq8J9hfZpBDJ5Qp2/XjZIH+Jkn29zoBe2LlXU
 J014wDKU9vPldaqg3Xr158YdsmLWJmsmFOOnXT5zih+2znV97JWmG79bglfmwwy15sb1
 6ia0o026Z5+cfOt/2SD4BK0gardy1Ca4GiQj1xs69ohVKJHM48oQJ+EvU0fEMVVpmSbz
 D8xA==
X-Forwarded-Encrypted: i=1;
 AHgh+RplPmdqPRI/ET5yPx1rh5aVPba+D4f9DvMKuu1XNNg/VJleCDT+STFpg3Z/G2sIYml1Mg3DE81vkmY=@nongnu.org
X-Gm-Message-State: AFuF++n0XXq1HtU2sYY3UBgIBPL8ieJRHxM5GaJh9kK/wisZNbRvtnbK
 BtzRAgKUEIeba6wxEleCSzMN1zCIiIAi5IJ62gebAtaUAeHSHL299d9z
X-Gm-Gg: AR+sD11T+UtEnPZsK5bylb6escrwdPRjIplBxGDImBkoC9qFXJMRhPMgaJUoEFpmTcw
 ScnmSlmBYlmiPMQ96RWGgymxi29E+MZnyvth1apSBuuhws+dCDc1CgP4W0nGYz4PD6E4okGsfzW
 YP8ODJ6dnl04HIA3qdg868lczMU86ch1DCqfHN4p93P+Dvf2AheAKiVaDFdmiDgqcIxrXHlZHbl
 MvL9j9KU15MPeZoY5WwI1QHA2n1iMTITPtPuV/K95+bFWcswEZxvjBT4/1jBG24PJWSke/6nKPy
 tZ7zX/ob32HHgLdYyKoNZH/FS0TDVYQUrqjHIBhB40nduX+0u288VM+RX2qoca6MGobkKWXN51A
 aMpb1TFdbNbEQAG/l/HbdV5AKpCq9vvtYcxuHmXv9xqhZEAZr1GTgO+HwnUzqctdjR24ltulUhS
 NFO2cAeq9+NmAWNAk3zUIaWHh1GSgZaWOpQY0ZdL4JiJH35Aq8NrcwSqRAaV5YorQekmraK80Sr
 wbQnhlpJ/CdJDpg6c5yaI32d6jra753/1fUbtGSXOOsHjpi6S4hHDWMpCY5FwfK3HHw468=
X-Received: by 2002:a05:6a20:9392:b0:3c4:3112:45 with SMTP id
 adf61e73a8af0-3cd4b9ea446mr11720814637.1.1787417694153; 
 Sat, 22 Aug 2026 09:54:54 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([117.55.237.216]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-327f91d2d1esm8688456eec.17.2026.08.22.09.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2026 09:54:53 -0700 (PDT)
From: Jack Wang <163wangjack@gmail.com>
Date: Sun, 23 Aug 2026 00:54:36 +0800
Subject: [PATCH RFC v2 2/5] rust: add hw/gpio crate to the workspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-stm32f100-gpio-v2-final-v2-2-02e31f589dd0@gmail.com>
References: <20260823-stm32f100-gpio-v2-final-v2-0-02e31f589dd0@gmail.com>
In-Reply-To: <20260823-stm32f100-gpio-v2-final-v2-0-02e31f589dd0@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Alexandre Iooss <erdnaxe@crans.org>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3324; i=163wangjack@gmail.com; 
 h=from:subject:message-id;
 bh=ekHy3ZWWMO/wiOwjaWf2p1JWI24Gmw3v+ipxsBvt78Q=; 
 b=owEBiQJ2/ZANAwAIARVa4Yx0u1BNAcsmYgBqidRS9rNpFg5k0DNoktbWx76plhb5uvJOI1OCi
 wKdBHZ0TuKJAk8EAAEIADkWIQQlXkw4qdbVYyKFm20VWuGMdLtQTQUCaonUUhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDMACgkQFVrhjHS7UE2NRQ/+JBZLNv1fAa4d9zwUZqP86FEmr5PGobL
 9joRSe+h0DFE9Jj0qWWgH7XPqEogfvSie1BLTixOH06AhbDCMLPkvYSbc6oDioy1xemqD6V4rcr
 3fIqPZBRIvbP/NZPmTn/PHNZcXISTcM0XRLB5w8XsWo+1qhuwDamUJ+9NWrpqLjbLo6oIRoFsEj
 G+4YA7cbXvjjSrFKK6CZkHFgprU2h2Tdii6QvaP1mCpywJhmdIkhvncqedp0gji2bLUV8pNC20b
 s+t0tQAUdpwUT7hsi2t4GEtosowVqNb6I0bmYzPzYuU4Lu9cB4kOfshIE5uJxyBgnROlDZVxa3L
 z1+/rDIrC9gTR2v1s5PtLjPzeE8Zh8SZmnuQFIVr4A7wEfzGtpj81UPsOTzJ61KOk79nwIcpkjX
 /kNth5IDhIw0B+KhYRiUMUv+dwM1e+6agxpRZAgsuLWxkf4vJjA8HM6HYIduzVrjVDXSPdrbu3H
 nPhBhxQiXrm5S5+CqPjb4w0dn2/VNeVge7A3qKMVMCrrW1B8+VkNWedd0aJcttlByKDt+n9sceD
 aYTlWkMHUMsZKj4jCwsCz8zLiO2dp00SLtk10Ux9qy4+8eSNISeYcZ76q3/LsfUDSnBktsMn6Pk
 vaw4v9JnMIsaOFEdTz7gsD30XjlwjoWgJWJoYhnuyt0Rp3k0eDPw=
X-Developer-Key: i=163wangjack@gmail.com; a=openpgp;
 fpr=255E4C38A9D6D56322859B6D155AE18C74BB504D
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=163wangjack@gmail.com; helo=mail-pg1-x535.google.com
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

Add the stm32f1xx_gpio crate to the QEMU Rust workspace and Meson/Kconfig build graph. Build it only when Rust support and the STM32F1xx GPIO configuration are enabled.

Keep native test registration out of this commit; it is added together with the test source later in the series.

Signed-off-by: Jack Wang <163wangjack@gmail.com>
---
 Cargo.lock               | 15 +++++++++++++++
 Cargo.toml               |  1 +
 rust/hw/Kconfig          |  1 +
 rust/hw/gpio/Cargo.toml  | 30 ++++++++++++++++++++++++++++++
 rust/hw/gpio/meson.build |  8 ++++++++
 rust/hw/meson.build      |  1 +
 6 files changed, 56 insertions(+)

diff --git a/Cargo.lock b/Cargo.lock
index ad664a812d..507257384e 100644
--- a/Cargo.lock
+++ b/Cargo.lock
@@ -314,6 +314,21 @@ version = "1.15.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "8ed6a63f02c8539c91a8685a86f4099661ba3da017932f6ebbea6de3f0fa7c90"
 
+[[package]]
+name = "stm32f1xx_gpio"
+version = "0.1.0"
+dependencies = [
+ "bql",
+ "common",
+ "glib-sys",
+ "hwcore",
+ "migration",
+ "qom",
+ "system",
+ "trace",
+ "util",
+]
+
 [[package]]
 name = "syn"
 version = "2.0.104"
diff --git a/Cargo.toml b/Cargo.toml
index b35704faab..5e25c307c1 100644
--- a/Cargo.toml
+++ b/Cargo.toml
@@ -2,6 +2,7 @@
 resolver = "2"
 members = [
     "rust/hw/char/pl011",
+    "rust/hw/gpio",
     "rust/hw/timer/hpet",
     "rust/tests",
 ]
diff --git a/rust/hw/Kconfig b/rust/hw/Kconfig
index 36f92ec028..ba1297ca2d 100644
--- a/rust/hw/Kconfig
+++ b/rust/hw/Kconfig
@@ -1,3 +1,4 @@
 # devices Kconfig
 source char/Kconfig
+source gpio/Kconfig
 source timer/Kconfig
diff --git a/rust/hw/gpio/Cargo.toml b/rust/hw/gpio/Cargo.toml
new file mode 100644
index 0000000000..f6a1407984
--- /dev/null
+++ b/rust/hw/gpio/Cargo.toml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+[package]
+name = "stm32f1xx_gpio"
+version = "0.1.0"
+description = "STM32F1xx GPIO device model for QEMU"
+resolver = "2"
+publish = false
+
+edition.workspace = true
+homepage.workspace = true
+license.workspace = true
+repository.workspace = true
+rust-version.workspace = true
+
+[dependencies]
+glib-sys.workspace = true
+
+# QEMU Rust foundations crate
+common = { path = "../../common" }
+util = { path = "../../util" }
+bql = { path = "../../bql" }
+migration = { path = "../../migration" }
+qom = { path = "../../qom" }
+system = { path = "../../system" }
+hwcore = { path = "../../hw/core" }
+trace = { path = "../../trace" }
+
+[lints]
+workspace = true
diff --git a/rust/hw/gpio/meson.build b/rust/hw/gpio/meson.build
new file mode 100644
index 0000000000..e359d7e329
--- /dev/null
+++ b/rust/hw/gpio/meson.build
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+_libstm32f1xx_gpio_rs = cargo_ws.package('stm32f1xx_gpio').library()
+
+rust_devices_ss.add(when: 'CONFIG_X_STM32F1XX_GPIO_RUST', if_true: [declare_dependency(
+  link_whole: [_libstm32f1xx_gpio_rs],
+  variables: {'crate': 'stm32f1xx_gpio'},
+)])
diff --git a/rust/hw/meson.build b/rust/hw/meson.build
index 9749d4adfc..d6b273170e 100644
--- a/rust/hw/meson.build
+++ b/rust/hw/meson.build
@@ -1,2 +1,3 @@
 subdir('char')
+subdir('gpio')
 subdir('timer')

-- 
2.53.0


