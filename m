Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3614C5DF97
	for <qemu-rust@archiver.kernel.org>; Sat, 22 Aug 2026 16:56:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wxozv-0002jh-Rd; Sat, 22 Aug 2026 12:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wxozu-0002id-Hu
 for qemu-rust@nongnu.org; Sat, 22 Aug 2026 12:55:10 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wxozr-0006uJ-W2
 for qemu-rust@nongnu.org; Sat, 22 Aug 2026 12:55:10 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-c9eefcf9175so2180396a12.3
 for <qemu-rust@nongnu.org>; Sat, 22 Aug 2026 09:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787417705; x=1788022505; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4bkFOugZCHA30/oOrSCQXtGUjmus+VNjc/uLTyUbkVc=;
 b=TKZS2GNhTMDOqJ6BdYCnnzYWQEDHLRVg6jnvB4kKYqssJYZDxGbNKGiyu++C/7QC35
 jALQ5S6i1AelBZhzoVHhvyzJPmZs0f+KaMa+p2pCN0xULSs8usrbuDUvsV4bMDuzFDsk
 WXBeVM886s306halF5D/akE64t2bPYerwcAXtVwPr4JSbFInrMd1xkIeP06mMf4id1/L
 17FaJN/8oI1NMDp+uDXzYcNX6w9xQneWWWC+LhvcPMkcktMaQhc6uB6awWawSwrCvaHB
 Q2rfqaqKbIs0WsNvHY4qF1YF9nvVVA/8SuPfufgU8HdMTSI+PuXgybHLUWihw2aDuYIe
 /USg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787417705; x=1788022505;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4bkFOugZCHA30/oOrSCQXtGUjmus+VNjc/uLTyUbkVc=;
 b=m1B8o3Vz7e3Jz4/gr6mQLvQeezw8/ToBWGRsWDRQqF+Qgx+edUweeAOiUjqdkcPShE
 fVGEh/OV6FtPR5jWFNbi899m9XumSMuXCR81WAWAASR6DUamw6u6wVntWFIbimd8Qw8O
 HOUCLehMEwjKn9TQBfNZ76dJnwyuz0ZrQtuvmwiOxJmkIMtOD/Jn+NEqKFnoQDL7zmmi
 BQgowGCVOEVYi1eE17gSMzBn9Jj8pm1ZVCj1mFpWHlKNGJxlXjj9/auFzo4KJZFIHUwy
 mg1EbrDlqyYMWtX5UX/NO35dR45TeYE3+sRGa5f7WQP7bi0YS9gcR63N7oAxiKSCTnNs
 fIPg==
X-Forwarded-Encrypted: i=1;
 AHgh+RolesIzwd1sUeyvRm21kR3Cpce9CnsJ275Zwp69GhZ42/PIv7fVtTPhQzYEIZvOQwpkg5mcRLg0KDQ=@nongnu.org
X-Gm-Message-State: AFuF++kcPJqFWuEb08Tcgjn9UVYOJYDPzk5iir1en5/H6FugMZCmPsdf
 65X1Y7nN8Os3wByX4X/Cz+lRmNe+9f9RungPoF9TpUDec4xlUIQ4QgID
X-Gm-Gg: AR+sD11bmaZCpOD8CNAuBfqrRM5fjAZIDcZH9LbD0kBDyoZgvekNhLSCJLTa9zyzFe0
 LfAPGnetT5HJXhLzSKfRW1fl4Mi2jAPwVd10R1aQ6cjXkMCDUuzegcfrujjc7KrVvTiqo1uLy9t
 VtgNQKthX76lIsQriOAOtyw6zKlIun+2WMSEaThvTr2dGh3L2YbL/ncUdzQfad4IVnyyueroHr1
 bUhMiIdk/vKMivBWVlGJ5W8KMS52i7vxMzXsvz0pMHN1IMLJQMoTrREvWvV1PbmHaHRtxuNLzHi
 Yhg3t3DJH9Ymhb+QeK7CzytyBtgbBQ3IwrEy3vLfWHdA0BBXY8kreNK2Ilolriti9tmp5MiybTS
 1KR3kleHfYgUm+oooG7wvqshe0lzMkS7/N7TmIkJrHdrHoTw5feh5F66nqupHHc2XXCoMhCglmI
 COUZW6BNiHMSFcosHNEsuXEP9QYXS7MZMfbfWsTma008oOLJcVKCGzTGw9KqSAb7GG1qQi+2z4V
 b33JwAvmWaulHcgTpZ4D2PYdKKRe0XaoT51R06PB4SQ+6MgNLc9nBeT7T7WO2iPNl0jyQ4=
X-Received: by 2002:a05:6a20:1605:b0:3c3:b57b:6285 with SMTP id
 adf61e73a8af0-3cd3003dc4fmr30205314637.13.1787417704776; 
 Sat, 22 Aug 2026 09:55:04 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([117.55.237.216]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-327f91d2d1esm8688456eec.17.2026.08.22.09.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2026 09:55:04 -0700 (PDT)
From: Jack Wang <163wangjack@gmail.com>
Date: Sun, 23 Aug 2026 00:54:39 +0800
Subject: [PATCH RFC v2 5/5] rust/hw/gpio: add native unit tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-stm32f100-gpio-v2-final-v2-5-02e31f589dd0@gmail.com>
References: <20260823-stm32f100-gpio-v2-final-v2-0-02e31f589dd0@gmail.com>
In-Reply-To: <20260823-stm32f100-gpio-v2-final-v2-0-02e31f589dd0@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Alexandre Iooss <erdnaxe@crans.org>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7737; i=163wangjack@gmail.com; 
 h=from:subject:message-id;
 bh=yVYaUseLeN8GbT/eETcCIH3Pg/3pKTO9OpyITwmHEYY=; 
 b=owEBiQJ2/ZANAwAIARVa4Yx0u1BNAcsmYgBqidRSVSM2VblINnot2yuUKr7JfwzbuOWvcM8SM
 8+nb0s9jmmJAk8EAAEIADkWIQQlXkw4qdbVYyKFm20VWuGMdLtQTQUCaonUUhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDMACgkQFVrhjHS7UE0E8g/9ECvfLDioTMcPVb4kdC8z2C0ZukRLrt2
 +6bSoaIFWc6TSKG9VfLp4aO/uhcgU3vOZ2Ki9XZ2kued/Oo59Z7qye5Qson8Hky6Msy/OuWMnA6
 JErbzF0mBm+/CyU0f0KBna1cvnMXXUpgnADTpWVmF4XukA33sgso2REA7nCUmCDxSrPi6P9WRrj
 nMNsFJLxvsUfRnftTAv6RtyToym39E1jUp7fZDlhswSCAMjd4X7oFEMcb//AoORBsd8PcveVXUs
 +1hZYV93ptRK3GsMmK0HbiVkf4IrPsrvo3U4UlUWFv9sjB0IcuSbC/TPLC9BrO9G4UF7l10pPih
 Lj0cAGVIBrnqxhdoAjzspzuyGu9ggOfHVkzV2b/BsVb4mIr4/v5fgBcZgHBJlna5JTkfLLhaVtS
 91iYv5FqfocrrPwnI3sQEWucTIQyPzw9+X0k2W+dRhADJCXzS3MUWH/PEDX4NJw8U+P/nApp3SS
 AK/d+LW7sy9aHoX+AFdEtO14xp5G/36uOxM2Mcdc1yZ/jSRig7MTEmJ7ne+lQRJrDLY2t+gSjh3
 +DqZ9nSZkFzUD/SytEHlGuSg4rNkNUtHDLG4+BNFbsAJ0+Jejp5Hmrl34GGnGp/OuYR0YfUGBhc
 CXeczQ/TFGb3empci8gLW5tolOues8ASWmJD9VRGIy4I/aGVMmjU=
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

Add native tests for the STM32F1xx GPIO register logic based on STM32F100xx RM0041.

Retain the v1 reset, push-pull, floating-input, pull and BSRR/BRR coverage. Add focused cases for analog input, released open-drain sampling, AF-output isolation, reset output deassertion and explicitly unimplemented LCKR behavior.

Register the native test target together with its source so intermediate commits do not reference a missing file.

Signed-off-by: Jack Wang <163wangjack@gmail.com>
---
 rust/hw/gpio/meson.build    |  41 +++++++++
 rust/hw/gpio/tests/tests.rs | 216 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 257 insertions(+)

diff --git a/rust/hw/gpio/meson.build b/rust/hw/gpio/meson.build
index e359d7e329..f0dd7d4acb 100644
--- a/rust/hw/gpio/meson.build
+++ b/rust/hw/gpio/meson.build
@@ -6,3 +6,44 @@ rust_devices_ss.add(when: 'CONFIG_X_STM32F1XX_GPIO_RUST', if_true: [declare_depe
   link_whole: [_libstm32f1xx_gpio_rs],
   variables: {'crate': 'stm32f1xx_gpio'},
 )])
+
+stm32f1xx_gpio_rs = declare_dependency(
+  link_with: [_libstm32f1xx_gpio_rs],
+  dependencies: [
+    common_rs,
+    qom_rs,
+    hwcore_rs,
+    bql_rs,
+    migration_rs,
+    system_rs,
+    util_rs,
+  ],
+)
+
+test(
+  'rust-stm32f1xx-gpio-integration',
+  executable(
+    'rust-stm32f1xx-gpio-integration',
+    files('tests/tests.rs'),
+    override_options: ['rust_std=2021', 'build.rust_std=2021'],
+    rust_args: ['--test'],
+    install: false,
+    dependencies: [
+      stm32f1xx_gpio_rs,
+      common_rs,
+      qom_rs,
+      hwcore_rs,
+      bql_rs,
+      migration_rs,
+      system_rs,
+      util_rs,
+    ],
+  ),
+  args: [
+    '--test',
+    '--test-threads', '1',
+    '--format', 'pretty',
+  ],
+  protocol: 'rust',
+  suite: ['unit', 'rust'],
+)
diff --git a/rust/hw/gpio/tests/tests.rs b/rust/hw/gpio/tests/tests.rs
new file mode 100644
index 0000000000..df71d205e0
--- /dev/null
+++ b/rust/hw/gpio/tests/tests.rs
@@ -0,0 +1,216 @@
+// Copyright 2026, Jack Wang
+// Author(s): Jack Wang <163wangjack@gmail.com>
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+use stm32f1xx_gpio::gpio::{
+    GpioRegisters, PinUpdate, REG_BRR, REG_BSRR, REG_CRH, REG_CRL, REG_IDR, REG_LCKR, REG_ODR,
+    RESET_CRH, RESET_CRL,
+};
+
+fn regs() -> GpioRegisters {
+    bql::start_test();
+    GpioRegisters::new()
+}
+
+const CFG_INPUT_ANALOG: u32 = 0x0;
+const CFG_INPUT_FLOATING: u32 = 0x4;
+const CFG_INPUT_PULL: u32 = 0x8;
+const CFG_OUTPUT_PP: u32 = 0x1;
+const CFG_OUTPUT_OD: u32 = 0x5;
+const CFG_AF_PP: u32 = 0x9;
+
+fn set_config(r: &GpioRegisters, pin: usize, cfg: u32) {
+    let reg = if pin < 8 { REG_CRL } else { REG_CRH };
+    let shift = ((pin % 8) * 4) as u32;
+    let old = r.read(reg);
+    r.write(reg, (old & !(0xF << shift)) | (cfg << shift));
+}
+
+fn set_odr_bit(r: &GpioRegisters, pin: usize, value: u32) {
+    let old = r.read(REG_ODR);
+    r.write(REG_ODR, (old & !(1 << pin)) | (value << pin));
+}
+
+fn pin_changed_to(upd: PinUpdate, pin: usize, level: bool) -> bool {
+    (upd.mask & (1 << pin)) != 0 && (((upd.levels >> pin) & 1) != 0) == level
+}
+
+#[test]
+fn test_reset_values() {
+    let r = regs();
+    assert_eq!(r.read(REG_CRL), RESET_CRL);
+    assert_eq!(r.read(REG_CRH), RESET_CRH);
+    assert_eq!(r.read(REG_IDR), 0);
+    assert_eq!(r.read(REG_ODR), 0);
+}
+
+#[test]
+fn test_reset_restores() {
+    let r = regs();
+    r.write(REG_CRL, 0xDEAD_BEEF);
+    r.write(REG_ODR, 0x0000_FFFF);
+    assert_ne!(r.read(REG_CRL), RESET_CRL);
+
+    r.reset();
+
+    assert_eq!(r.read(REG_CRL), RESET_CRL);
+    assert_eq!(r.read(REG_CRH), RESET_CRH);
+    assert_eq!(r.read(REG_IDR), 0);
+    assert_eq!(r.read(REG_ODR), 0);
+}
+
+#[test]
+fn test_output_mode() {
+    let r = regs();
+    let pin = 5;
+
+    let idle = set_odr_and_report(&r, pin, 1);
+    assert_eq!(r.read(REG_IDR), 0);
+    assert_eq!(idle.mask & (1 << pin), 0);
+
+    let old = r.read(REG_CRL);
+    let to_output = r.write(
+        REG_CRL,
+        (old & !(0xF << (pin * 4))) | (CFG_OUTPUT_PP << (pin * 4)),
+    );
+    assert_eq!(r.read(REG_IDR), 1 << pin);
+    assert!(pin_changed_to(to_output, pin, true));
+
+    let to_low = set_odr_and_report(&r, pin, 0);
+    assert_eq!(r.read(REG_IDR), 0);
+    assert!(pin_changed_to(to_low, pin, false));
+}
+
+fn set_odr_and_report(r: &GpioRegisters, pin: usize, value: u32) -> PinUpdate {
+    let old = r.read(REG_ODR);
+    r.write(REG_ODR, (old & !(1 << pin)) | (value << pin))
+}
+
+#[test]
+fn test_input_mode() {
+    let r = regs();
+    let pin = 6usize;
+
+    set_config(&r, pin, CFG_INPUT_FLOATING);
+
+    let drive_high = r.gpio_set(pin, 1);
+    assert_eq!(r.read(REG_IDR), 1 << pin);
+    assert!(pin_changed_to(drive_high, pin, true));
+
+    let drive_low = r.gpio_set(pin, 0);
+    assert_eq!(r.read(REG_IDR), 0);
+    assert!(pin_changed_to(drive_low, pin, false));
+}
+
+#[test]
+fn test_pull_up_down() {
+    let r = regs();
+    let pin = 0;
+
+    set_odr_bit(&r, pin, 1);
+    set_config(&r, pin, CFG_INPUT_PULL);
+    assert_eq!(r.read(REG_IDR), 1 << pin);
+
+    set_odr_bit(&r, pin, 0);
+    assert_eq!(r.read(REG_IDR), 0);
+}
+
+#[test]
+fn test_bsrr_brr() {
+    let r = regs();
+    let pin = 1;
+
+    r.write(REG_BSRR, 1 << pin);
+    assert_eq!(r.read(REG_ODR), 1 << pin);
+
+    r.write(REG_BSRR, 1 << (pin + 16));
+    assert_eq!(r.read(REG_ODR), 0);
+
+    r.write(REG_BSRR, 1 << pin);
+    r.write(REG_BRR, 1 << pin);
+    assert_eq!(r.read(REG_ODR), 0);
+
+    // Set has priority over reset within one BSRR write.
+    r.write(REG_BSRR, (1 << pin) | (1 << (pin + 16)));
+    assert_eq!(r.read(REG_ODR), 1 << pin);
+}
+
+#[test]
+fn test_push_pull_disconnect() {
+    let r = regs();
+    let pin = 7usize;
+
+    set_config(&r, pin, CFG_INPUT_FLOATING);
+    r.gpio_set(pin, 1);
+    assert_eq!(r.read(REG_IDR), 1 << pin);
+    assert_eq!(r.disconnected_pins() & (1 << pin), 0);
+
+    set_odr_bit(&r, pin, 0);
+    set_config(&r, pin, CFG_OUTPUT_PP);
+    assert_eq!(r.read(REG_IDR), 0);
+    assert_ne!(r.disconnected_pins() & (1 << pin), 0);
+
+    r.gpio_set(pin, 1);
+    assert_eq!(r.read(REG_IDR), 0);
+}
+
+#[test]
+fn test_analog_input_is_digitally_low() {
+    let r = regs();
+    let pin = 0;
+
+    set_config(&r, pin, CFG_INPUT_ANALOG);
+    r.gpio_set(pin, 1);
+
+    assert_eq!(r.read(REG_IDR) & (1 << pin), 0);
+}
+
+#[test]
+fn test_open_drain_released_samples_external_input() {
+    let r = regs();
+    let pin = 1;
+
+    set_config(&r, pin, CFG_OUTPUT_OD);
+    set_odr_bit(&r, pin, 1);
+
+    r.gpio_set(pin, 1);
+    assert_eq!(r.read(REG_IDR) & (1 << pin), 1 << pin);
+
+    r.gpio_set(pin, 0);
+    assert_eq!(r.read(REG_IDR) & (1 << pin), 0);
+}
+
+#[test]
+fn test_af_output_does_not_follow_odr() {
+    let r = regs();
+    let pin = 2;
+
+    set_config(&r, pin, CFG_AF_PP);
+    set_odr_bit(&r, pin, 1);
+
+    assert_eq!(r.read(REG_IDR) & (1 << pin), 0);
+}
+
+#[test]
+fn test_reset_deasserts_previous_high_output() {
+    let r = regs();
+    let pin = 3;
+
+    set_config(&r, pin, CFG_OUTPUT_PP);
+    set_odr_bit(&r, pin, 1);
+    assert_eq!(r.read(REG_IDR) & (1 << pin), 1 << pin);
+
+    let update = r.reset();
+
+    assert_ne!(update.mask & (1 << pin), 0);
+    assert_eq!(update.levels & (1 << pin), 0);
+}
+
+#[test]
+fn test_lckr_is_explicitly_unimplemented() {
+    let r = regs();
+
+    r.write(REG_LCKR, 0x0001_0001);
+
+    assert_eq!(r.read(REG_LCKR), 0);
+}

-- 
2.53.0


