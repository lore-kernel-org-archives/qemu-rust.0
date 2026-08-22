Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65948C5DF9B
	for <qemu-rust@archiver.kernel.org>; Sat, 22 Aug 2026 16:55:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wxozt-0002hc-5g; Sat, 22 Aug 2026 12:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wxozr-0002hE-Lc
 for qemu-rust@nongnu.org; Sat, 22 Aug 2026 12:55:07 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wxozo-0006iO-4g
 for qemu-rust@nongnu.org; Sat, 22 Aug 2026 12:55:07 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-38511175ad3so1869279a91.2
 for <qemu-rust@nongnu.org>; Sat, 22 Aug 2026 09:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787417701; x=1788022501; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=If1q46hsy+fNHIxv/NY6fJEaikfzuAFWzoaODXwM524=;
 b=YwwjKUVSxgkRDZopTFtzspcU/6JvlMiwvtcnJOrP49SFSKkTcvwqJNuKMh7d9LRWtB
 AqsTlXx1ZBdXT+GG95/nWvL+tH7KLtSn1rt49HtJt8yOjwrhXPop/CGB4hzuNnLX/l2R
 3d8VqqskW0byqF4QJPsosCPwX+mwicZrElnr8gLD9YQQmSEjgMZ+6XSfQmXaF0i+nRZi
 PlM2lvRuk/XUZd+3FYmx0gX9QkMNGhGzy/2kIw2tQt/lyIQLNSbJjX/NYUg0dX/yoZLs
 diP2tizVxU7vpDvIyHSWPyimBz95qcjrq8V6mX3gygO1lEKT8K8bZre84m40SaosGr6g
 loTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787417701; x=1788022501;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=If1q46hsy+fNHIxv/NY6fJEaikfzuAFWzoaODXwM524=;
 b=DQ2eqpDC4EqjOFHmSUL60NQpS8gqcvhKxZoSsSKLCB6Zl01e71sRpzI5HJSdZBRwur
 eAbvJd/2RzDdd4xEkSXTn2zrusLA5VN9Wz12/zL8M7zc1mw0IgsONCel9YdW/VU7GwyB
 FcurPZHULPyPDBCBBZliw/kykLJqrb6AfMhk27e0EhGFO2D98k7/rx0Hy2fjkpWlp9VV
 P+01v0n9DXNHeDvFVQIHzVk3nz4sm2bVimIuqN5E/lObB6vQ775IUSz5mLOKqH5t6bFd
 OTws/Ihnpb9nZ98itLLr+KArE5ItB+wqvp121NWIhgBYfLgmPThBbHY66DuKhdLL0PrF
 ADKg==
X-Forwarded-Encrypted: i=1;
 AHgh+Robi0hXxe9Mz5xU6B8K0p29qauW9RcXD592J/Nm1Nx+CECntky6++OMexqB/q/QOOP0YT7ZQ3m5niY=@nongnu.org
X-Gm-Message-State: AFuF++l+3SSZ8X+e/ZXffLAxG/HSt2Ocb18WhqE9qWvj2bPGGaQtxvtI
 nRPEDD/G0DVTSahPlpOamZMeoafnvDAJlk2S9qNHa+61/St2V76IiCFQ
X-Gm-Gg: AR+sD11vfEgTLJDg/VLDGa0TLM+TUIbvh1gyNQzBNKlGFeFaKieazh1e9lZ7VQ95won
 UMb22MfJB/DlrXP7U6pUba9Ee6/Z3bu5TrbtozHpz9r5tP0vs/RJg6ZTn9EaErR2PckGPvisMv6
 S+pyK0UM7F7LA3SFxAI2UtLNypOMwhoxVUYs64l+lNejmbsdoLO7d4v3lnDgX5gPh7XnT2b9LLl
 f0oYYjNdIjPmq1h+kvbdDQhW1D5vB4wZnGb/9HoT1YwdNmyy2dgQkM2EeIu7Z9reiQh2nxdsMZ5
 G2IqTTF0ZkNR/nSj8aL197Lh3tW3/rju0Q0yn9S29fT0p5s3DXZAuY3GlS8sxvErShyO+dJQlj/
 G7g9VSxQTB/eoQdIeGXVDLVxYTj7PiJO1GQutvoLkE4Py6s06fybCuRG2FNJmlw0eL/gfSPfvL2
 RMSikjMVbYz3sL8lDcKuquBrP+6gZ9pvY45Hse9if8EYLjMVdPdJVxa3UNynSjBpnhqsntF2OIa
 yS5Lyhat+6Ja9EiJgw/sVcnNCw0cS1V0T/tRg5AqbCbCa96YmI9DKJq1yZygdVgiW5Yg9A=
X-Received: by 2002:a17:90b:384d:b0:38e:6aa7:68ad with SMTP id
 98e67ed59e1d1-395c3503b04mr23027179a91.5.1787417701124; 
 Sat, 22 Aug 2026 09:55:01 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([117.55.237.216]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-327f91d2d1esm8688456eec.17.2026.08.22.09.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2026 09:55:00 -0700 (PDT)
From: Jack Wang <163wangjack@gmail.com>
Date: Sun, 23 Aug 2026 00:54:38 +0800
Subject: [PATCH RFC v2 4/5] tests/qtest: add STM32F100 GPIO tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-stm32f100-gpio-v2-final-v2-4-02e31f589dd0@gmail.com>
References: <20260823-stm32f100-gpio-v2-final-v2-0-02e31f589dd0@gmail.com>
In-Reply-To: <20260823-stm32f100-gpio-v2-final-v2-0-02e31f589dd0@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Alexandre Iooss <erdnaxe@crans.org>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13486;
 i=163wangjack@gmail.com; h=from:subject:message-id;
 bh=IE9tGBd8c/9oqC9mEVDgI2WpJzFdjT8+Z1kPz4HWt/Q=;
 b=owEBiQJ2/ZANAwAIARVa4Yx0u1BNAcsmYgBqidRSgcyTvc9sHN8+JjttDh8I0qgno3F5pYC6e
 TelsLa0oI+JAk8EAAEIADkWIQQlXkw4qdbVYyKFm20VWuGMdLtQTQUCaonUUhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDMACgkQFVrhjHS7UE3rWA/+Kfm1lQY2dnyVDk7bvU4NH/+X6sVQfRN
 sateym7tVJWhlqA1vcpMS0q8TBHePGwlOxvmYCw+xgvvks9SytK6sHJDHrnwroli8eM1U90MrR0
 07IBa0NSxwNVKcdYuQBY30Ak8vgyIQD+kOBXW6lsoDYYydB26fyDgBWmm8D7WRLKuB5OMycjXhO
 DdQ3TPSwULw8ex8VO4Zjikk8icO/XAyP1lvEk9K8uTo/d8QnM4u7OGnUxDMmIq4PzxGoOgFNn73
 ejZ67w+EZ0t/se3gxVURaOxECHCc+mKgBgVTTzqYTBAfVkyc+pV1d1Y7S3iWOk2kWEYMLjqph+v
 8uX7W7u+SFKvYGcYDXfsAUjMkRuvOpk+JKUloVrJKD8qn8w1bLr7NSsrF7R1QCblQN3pFzDDLlW
 AvYnuCfdsNaXEWKggyx6wwLbMeQidQASTc05aByj6/FcuolHxIbf9Bpl/rzGq+GoVVI8d9RLaVv
 52KCWdJ/BmgJQ7hsD52nNA1KIOCyZePEW5lMsAlCYZ0EU1R/SDSI+VXjsyli+hvG40I6rs2WIdh
 Yag26ziNOumGaC26tBmUZg0Q/GOQ58oNFH1MW1BVmQ/Sri1p0X1RT8MYWyuELmlGQG2KU5c/V4n
 AculGMh3enxQIitfDa3ACXRvoZl3gkFiH83ZQgDFddUNMGQc8vEo=
X-Developer-Key: i=163wangjack@gmail.com; a=openpgp;
 fpr=255E4C38A9D6D56322859B6D155AE18C74BB504D
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=163wangjack@gmail.com; helo=mail-pj1-x102a.google.com
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

Add integration coverage for the STM32F1xx GPIO device on the stm32vldiscovery machine and its five GPIOA-E instances.

Retain the v1 register and GPIO-line coverage and add focused cases for analog input, released open-drain sampling, AF-output isolation, reset output deassertion, word-only MMIO and explicitly unimplemented LCKR behavior.

When the Rust device is unavailable, keep a machine-start smoke test for the unimplemented-device fallback.

Signed-off-by: Jack Wang <163wangjack@gmail.com>
---
 tests/qtest/meson.build           |   4 +
 tests/qtest/stm32f100_gpio-test.c | 380 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 384 insertions(+)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 12ed368997..d05ce065cd 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -239,6 +239,9 @@ qtests_stm32l4x5 = \
    'stm32l4x5_gpio-test',
    'stm32l4x5_usart-test']
 
+qtests_stm32f100 = \
+  ['stm32f100_gpio-test']
+
 qtests_arm = \
   (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-dualtimer-test'] : []) + \
@@ -254,6 +257,7 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_VEXPRESS') ? ['test-arm-mptimer'] : []) + \
   (config_all_devices.has_key('CONFIG_MICROBIT') ? ['microbit-test'] : []) + \
   (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') ? qtests_stm32l4x5 : []) + \
+  (config_all_devices.has_key('CONFIG_STM32F100_SOC') ? qtests_stm32f100 : []) + \
   (config_all_devices.has_key('CONFIG_FSI_APB2OPB_ASPEED') ? ['aspeed_fsi-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CAN_FLEXCAN') ? ['flexcan-test'] : []) + \
   (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') and
diff --git a/tests/qtest/stm32f100_gpio-test.c b/tests/qtest/stm32f100_gpio-test.c
new file mode 100644
index 0000000000..ea8483c1e4
--- /dev/null
+++ b/tests/qtest/stm32f100_gpio-test.c
@@ -0,0 +1,380 @@
+/*
+ * QTest testcase for STM32F100 GPIO (Rust device "stm32f1xx-gpio-rust")
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2026 QEMU contributors
+ *
+ * The STM32F1 GPIO differs from the L4 family: each pin is configured by a
+ * 4-bit field MODE[1:0]+CNF[1:0] packed into CRL (pins 0-7) and CRH (pins
+ * 8-15), instead of the separate MODER/OTYPER/PUPDR registers of the L4.
+ * See ST RM0041 for the register map and reset values.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+
+#define GPIO_BASE_ADDR 0x40010800
+#define GPIO_SIZE      0x400
+#define NUM_GPIOS      5
+#define NUM_GPIO_PINS  16
+
+#define GPIO_A 0x40010800
+#define GPIO_B 0x40010C00
+#define GPIO_C 0x40011000
+#define GPIO_D 0x40011400
+#define GPIO_E 0x40011800
+
+#define CRL  0x00
+#define CRH  0x04
+#define IDR  0x08
+#define ODR  0x0C
+#define BSRR 0x10
+#define BRR  0x14
+#define LCKR 0x18
+
+#define CFG_INPUT_FLOATING   0x4
+#define CFG_INPUT_ANALOG     0x0
+#define CFG_INPUT_PULL       0x8
+#define CFG_OUTPUT_PP        0x1
+#define CFG_OUTPUT_OD        0x5
+#define CFG_AF_PP            0x9
+
+#define CR_RESET 0x44444444
+
+static uint32_t gpio_readl(unsigned int gpio, unsigned int offset)
+{
+    return readl(gpio + offset);
+}
+
+static void gpio_writel(unsigned int gpio, unsigned int offset, uint32_t value)
+{
+    writel(gpio + offset, value);
+}
+
+static void gpio_set_config(unsigned int gpio, unsigned int pin, uint8_t cfg)
+{
+    unsigned int reg = (pin < 8) ? CRL : CRH;
+    unsigned int shift = (pin % 8) * 4;
+    uint32_t mask = ~(0xFu << shift);
+    uint32_t val = (gpio_readl(gpio, reg) & mask) | ((uint32_t)cfg << shift);
+    gpio_writel(gpio, reg, val);
+}
+
+static void gpio_set_odr_bit(unsigned int gpio, unsigned int pin,
+                             uint32_t value)
+{
+    uint32_t mask = ~(0x1u << pin);
+    gpio_writel(gpio, ODR, (gpio_readl(gpio, ODR) & mask) | (value << pin));
+}
+
+static unsigned int get_gpio_id(uint32_t gpio_addr)
+{
+    return (gpio_addr - GPIO_BASE_ADDR) / GPIO_SIZE;
+}
+
+static const char *gpio_path(uint32_t gpio)
+{
+    static char buf[32];
+    snprintf(buf, sizeof(buf), "/machine/soc/gpio%c", 'a' + get_gpio_id(gpio));
+    return buf;
+}
+
+static void gpio_set_irq(unsigned int gpio, int num, int level)
+{
+    qtest_set_irq_in(global_qtest, gpio_path(gpio), NULL, num, level);
+}
+
+/* qtest can intercept one device's outputs per session; use GPIOA. */
+static void intercept_out(unsigned int gpio)
+{
+    qtest_irq_intercept_out(global_qtest, gpio_path(gpio));
+}
+
+static void reset_gpio(unsigned int gpio)
+{
+    gpio_writel(gpio, CRL, CR_RESET);
+    gpio_writel(gpio, CRH, CR_RESET);
+    gpio_writel(gpio, ODR, 0);
+}
+
+static void test_reset_values(void)
+{
+    gpio_writel(GPIO_A, CRL, 0xDEADBEEF);
+    gpio_writel(GPIO_A, CRH, 0xDEADBEEF);
+    gpio_writel(GPIO_A, ODR, 0xDEADBEEF);
+
+    gpio_writel(GPIO_C, CRL, 0x12345678);
+    gpio_writel(GPIO_C, ODR, 0x0000FFFF);
+
+    qtest_system_reset(global_qtest);
+
+    g_assert_cmphex(gpio_readl(GPIO_A, CRL), ==, CR_RESET);
+    g_assert_cmphex(gpio_readl(GPIO_A, CRH), ==, CR_RESET);
+    g_assert_cmphex(gpio_readl(GPIO_A, IDR), ==, 0);
+    g_assert_cmphex(gpio_readl(GPIO_A, ODR), ==, 0);
+
+    g_assert_cmphex(gpio_readl(GPIO_C, CRL), ==, CR_RESET);
+    g_assert_cmphex(gpio_readl(GPIO_C, IDR), ==, 0);
+    g_assert_cmphex(gpio_readl(GPIO_C, ODR), ==, 0);
+}
+
+static void test_output_mode(const void *data)
+{
+    unsigned int pin = (uintptr_t)data & 0xF;
+    uint32_t gpio = (uintptr_t)data & ~(GPIO_SIZE - 1);
+    bool observe = (gpio == GPIO_A);
+
+    reset_gpio(gpio);
+    if (observe) {
+        intercept_out(gpio);
+    }
+
+    gpio_set_odr_bit(gpio, pin, 1);
+    g_assert_cmphex(gpio_readl(gpio, IDR), ==, 0);
+    if (observe) {
+        g_assert_false(get_irq(pin));
+    }
+
+    gpio_set_config(gpio, pin, CFG_OUTPUT_PP);
+    g_assert_cmphex(gpio_readl(gpio, IDR), ==, (1u << pin));
+    if (observe) {
+        g_assert_true(get_irq(pin));
+    }
+
+    gpio_set_odr_bit(gpio, pin, 0);
+    g_assert_cmphex(gpio_readl(gpio, IDR), ==, 0);
+    if (observe) {
+        g_assert_false(get_irq(pin));
+    }
+
+    reset_gpio(gpio);
+}
+
+static void test_input_mode(const void *data)
+{
+    unsigned int pin = (uintptr_t)data & 0xF;
+    uint32_t gpio = (uintptr_t)data & ~(GPIO_SIZE - 1);
+    bool observe = (gpio == GPIO_A);
+
+    reset_gpio(gpio);
+    if (observe) {
+        intercept_out(gpio);
+    }
+
+    gpio_set_config(gpio, pin, CFG_INPUT_FLOATING);
+
+    gpio_set_irq(gpio, pin, 1);
+    g_assert_cmphex(gpio_readl(gpio, IDR), ==, (1u << pin));
+    if (observe) {
+        g_assert_true(get_irq(pin));
+    }
+
+    gpio_set_irq(gpio, pin, 0);
+    g_assert_cmphex(gpio_readl(gpio, IDR), ==, 0);
+    if (observe) {
+        g_assert_false(get_irq(pin));
+    }
+
+    reset_gpio(gpio);
+}
+
+static void test_pull_up_down(const void *data)
+{
+    unsigned int pin = (uintptr_t)data & 0xF;
+    uint32_t gpio = (uintptr_t)data & ~(GPIO_SIZE - 1);
+
+    reset_gpio(gpio);
+    intercept_out(gpio);
+
+    gpio_set_odr_bit(gpio, pin, 1);
+    gpio_set_config(gpio, pin, CFG_INPUT_PULL);
+    g_assert_cmphex(gpio_readl(gpio, IDR), ==, (1u << pin));
+    g_assert_true(get_irq(pin));
+
+    gpio_set_odr_bit(gpio, pin, 0);
+    g_assert_cmphex(gpio_readl(gpio, IDR), ==, 0);
+    g_assert_false(get_irq(pin));
+
+    reset_gpio(gpio);
+}
+
+static void test_bsrr_brr(const void *data)
+{
+    unsigned int pin = (uintptr_t)data & 0xF;
+    uint32_t gpio = (uintptr_t)data & ~(GPIO_SIZE - 1);
+
+    reset_gpio(gpio);
+
+    gpio_writel(gpio, BSRR, (1u << pin));
+    g_assert_cmphex(gpio_readl(gpio, ODR), ==, (1u << pin));
+
+    gpio_writel(gpio, BSRR, (1u << (pin + 16)));
+    g_assert_cmphex(gpio_readl(gpio, ODR), ==, 0);
+
+    gpio_writel(gpio, BSRR, (1u << pin));
+    g_assert_cmphex(gpio_readl(gpio, ODR), ==, (1u << pin));
+
+    gpio_writel(gpio, BRR, (1u << pin));
+    g_assert_cmphex(gpio_readl(gpio, ODR), ==, 0);
+
+    /* Set has priority over reset in BSRR. */
+    gpio_writel(gpio, BSRR, (1u << pin) | (1u << (pin + 16)));
+    g_assert_cmphex(gpio_readl(gpio, ODR), ==, (1u << pin));
+
+    reset_gpio(gpio);
+}
+
+static void test_push_pull_disconnect(const void *data)
+{
+    unsigned int pin = (uintptr_t)data & 0xF;
+    uint32_t gpio = (uintptr_t)data & ~(GPIO_SIZE - 1);
+
+    reset_gpio(gpio);
+
+    gpio_set_config(gpio, pin, CFG_INPUT_FLOATING);
+    gpio_set_irq(gpio, pin, 1);
+    g_assert_cmphex(gpio_readl(gpio, IDR), ==, (1u << pin));
+
+    gpio_set_odr_bit(gpio, pin, 0);
+    gpio_set_config(gpio, pin, CFG_OUTPUT_PP);
+    g_assert_cmphex(gpio_readl(gpio, IDR), ==, 0);
+
+    gpio_set_irq(gpio, pin, 1);
+    g_assert_cmphex(gpio_readl(gpio, IDR), ==, 0);
+
+    reset_gpio(gpio);
+}
+
+static void test_analog_input(void)
+{
+    reset_gpio(GPIO_A);
+    gpio_set_config(GPIO_A, 0, CFG_INPUT_ANALOG);
+    gpio_set_irq(GPIO_A, 0, 1);
+
+    g_assert_cmphex(gpio_readl(GPIO_A, IDR) & 1, ==, 0);
+
+    reset_gpio(GPIO_A);
+}
+
+static void test_open_drain_released(void)
+{
+    reset_gpio(GPIO_A);
+    gpio_set_config(GPIO_A, 1, CFG_OUTPUT_OD);
+    gpio_set_odr_bit(GPIO_A, 1, 1);
+
+    gpio_set_irq(GPIO_A, 1, 1);
+    g_assert_cmphex(gpio_readl(GPIO_A, IDR) & (1u << 1), ==, 1u << 1);
+
+    gpio_set_irq(GPIO_A, 1, 0);
+    g_assert_cmphex(gpio_readl(GPIO_A, IDR) & (1u << 1), ==, 0);
+
+    reset_gpio(GPIO_A);
+}
+
+static void test_af_output_not_driven_by_odr(void)
+{
+    reset_gpio(GPIO_A);
+    gpio_set_config(GPIO_A, 2, CFG_AF_PP);
+    gpio_set_odr_bit(GPIO_A, 2, 1);
+
+    g_assert_cmphex(gpio_readl(GPIO_A, IDR) & (1u << 2), ==, 0);
+
+    reset_gpio(GPIO_A);
+}
+
+static void test_reset_deasserts_output(void)
+{
+    reset_gpio(GPIO_A);
+    intercept_out(GPIO_A);
+    gpio_set_config(GPIO_A, 3, CFG_OUTPUT_PP);
+    gpio_set_odr_bit(GPIO_A, 3, 1);
+    g_assert_true(get_irq(3));
+
+    qtest_system_reset(global_qtest);
+
+    g_assert_false(get_irq(3));
+    g_assert_cmphex(gpio_readl(GPIO_A, ODR), ==, 0);
+}
+
+static void test_lckr_unimplemented(void)
+{
+    reset_gpio(GPIO_A);
+    gpio_writel(GPIO_A, LCKR, 0x00010001);
+    g_assert_cmphex(gpio_readl(GPIO_A, LCKR), ==, 0);
+}
+
+static void test_word_access_only(void)
+{
+    gpio_writel(GPIO_A, ODR, 0x55aa);
+
+    writeb(GPIO_A + ODR, 0xff);
+    g_assert_cmphex(gpio_readl(GPIO_A, ODR), ==, 0x55aa);
+
+    writew(GPIO_A + ODR, 0xffff);
+    g_assert_cmphex(gpio_readl(GPIO_A, ODR), ==, 0x55aa);
+
+    writel(GPIO_A + ODR + 1, 0xffffffff);
+    g_assert_cmphex(gpio_readl(GPIO_A, ODR), ==, 0x55aa);
+
+    reset_gpio(GPIO_A);
+}
+
+static void test_machine_started(void)
+{
+    g_assert_nonnull(global_qtest);
+}
+
+static void register_gpio_tests(void)
+{
+    qtest_add_func("stm32f100/gpio/reset_values", test_reset_values);
+    qtest_add_data_func("stm32f100/gpio/output_mode_a5",
+                        (void *)(uintptr_t)(GPIO_A | 5), test_output_mode);
+    qtest_add_data_func("stm32f100/gpio/output_mode_c13",
+                        (void *)(uintptr_t)(GPIO_C | 13), test_output_mode);
+    qtest_add_data_func("stm32f100/gpio/input_mode_b6",
+                        (void *)(uintptr_t)(GPIO_B | 6), test_input_mode);
+    qtest_add_data_func("stm32f100/gpio/input_mode_d10",
+                        (void *)(uintptr_t)(GPIO_D | 10), test_input_mode);
+    qtest_add_data_func("stm32f100/gpio/pull_up_down_a0",
+                        (void *)(uintptr_t)(GPIO_A | 0), test_pull_up_down);
+    qtest_add_data_func("stm32f100/gpio/bsrr_brr_a1",
+                        (void *)(uintptr_t)(GPIO_A | 1), test_bsrr_brr);
+    qtest_add_data_func("stm32f100/gpio/bsrr_brr_e12",
+                        (void *)(uintptr_t)(GPIO_E | 12), test_bsrr_brr);
+    qtest_add_data_func("stm32f100/gpio/push_pull_disconnect_e7",
+                        (void *)(uintptr_t)(GPIO_E | 7),
+                        test_push_pull_disconnect);
+    qtest_add_func("stm32f100/gpio/analog_input", test_analog_input);
+    qtest_add_func("stm32f100/gpio/open_drain_released",
+                   test_open_drain_released);
+    qtest_add_func("stm32f100/gpio/af_output_not_driven_by_odr",
+                   test_af_output_not_driven_by_odr);
+    qtest_add_func("stm32f100/gpio/reset_deasserts_output",
+                   test_reset_deasserts_output);
+    qtest_add_func("stm32f100/gpio/lckr_unimplemented",
+                   test_lckr_unimplemented);
+    qtest_add_func("stm32f100/gpio/word_access_only",
+                   test_word_access_only);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+    g_test_set_nonfatal_assertions();
+
+    if (qtest_has_device("stm32f1xx-gpio-rust")) {
+        register_gpio_tests();
+    } else {
+        qtest_add_func("stm32f100/gpio/no_rust_machine_start",
+                       test_machine_started);
+    }
+
+    qtest_start("-machine stm32vldiscovery");
+    ret = g_test_run();
+    qtest_end();
+
+    return ret;
+}

-- 
2.53.0


