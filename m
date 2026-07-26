Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142A7C531C9
	for <qemu-rust@archiver.kernel.org>; Sun, 26 Jul 2026 14:53:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wo0Cq-0005uE-9w; Sun, 26 Jul 2026 10:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wo0Cf-0005s0-5y
 for qemu-rust@nongnu.org; Sun, 26 Jul 2026 10:51:45 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wo0Cc-0005zO-1a
 for qemu-rust@nongnu.org; Sun, 26 Jul 2026 10:51:44 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2ceb096e675so22683185ad.0
 for <qemu-rust@nongnu.org>; Sun, 26 Jul 2026 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785077498; x=1785682298; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=gMvRGC+W81P7nB/Cv+wkkm/hmnFBdzMzFGZ00e08Edw=;
 b=FmPWmU1OLVqpxqSXIG0uRwusPzkhle8901WOdYCE3Hmdm0rSsT+SWE1MXqB5AhfYjT
 jA9+6EzXmqHrOLi3ZRYQiGYyJkICzemUm9jZK2bscDU3YG7+a20X2saUFsMEx50V+Af5
 t4jPajp+vpbwqpHajgUoiWYjhAg4X7JrgRcT5ZgcWgMFZ9BIeEURU86gV/nDo2NxandH
 gYWWvCmqIWGdPn6L9vYYrVnopSZ+pEAfO+EnFhHYpWSNs+h7XgRalfjA0d4FadtIFmg4
 SObczchLGdfvb0rXPm8tZj8/iLeliCzgh8OUfjBSB3MFroyyq2rLdFL2JdrZFwsDSnwc
 j+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785077498; x=1785682298;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gMvRGC+W81P7nB/Cv+wkkm/hmnFBdzMzFGZ00e08Edw=;
 b=QKkEzM76x/1vXWymS9l+dyk2GFEbyyCRrMqYalSiEQsFZGs8CDDeO2tVFf9mI4SmT/
 zLPM71TZTmYdXkSV59X1worLIbiJqLRoEpCywCZOgYAehWQ9jh64kVMljEIG7VldTx9E
 QElCuUX9YFI5qiOVVIp6DFr1FEvEz+CzIYeNhyT5lYfg7vQGjqjwd+2qSK8iSjkSNNPC
 RN5bqje8mWCiaNlc7YASt90CCfgUGxYlAjojtQilHOSVuYtZJa1OXJyuFtA40eqhdkYN
 5xnFJ1Qyo22VgSYIIpgSA96xAehPAw9jVUFK9kj/hzQIE8p+A2ZELbzaaiFcnVXNSHeZ
 E2qQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp6GYa4NhD+uFammhRSRkyN5bsLgLOeJT8PV5udXnYUQipV0mzPcxDVzMyl3rJAYOc0rAFdkulO4gc=@nongnu.org
X-Gm-Message-State: AOJu0Yypd9i3LpwjqJAMyQRc70RUYDhVDDxgYyNU4dJJ8TOmRGM+V1Tm
 +mLZD977J3nz6LbjsdiN83xFw3sdZMlzY8YGt6qgtpwAnTdJ0BCmKssY
X-Gm-Gg: AR+sD11K1G19SQOciobxAPi3jRBrH9FDVmwFmDuJ9rW8aM6Vwt0IiifMg3HHsI17XtO
 Thi8hxkC/P9tA+v8w5b55yCSC+kxDWhCW9XgmZLfhCAmuYVNorFvJo4xz7U5QD9A9j+ueMKY5t/
 /GbRsOUpptvqgf+q0NmWtG1cKisaAtE3lez+F7ksFfMjXwZeSv/PLh5dsc1FtEthz83QaZdzgao
 na28XCyd7NfYeJ4069SieQSQm10HvS8WLKSNDO3rTTzvu7+d12sofT4ZlK49EmMX7n1eFc+XRuj
 1pBN1/9AkKcKqj/nh2BebBpuLac09eyKjyZsD6cQeWsBXawS2nzKL+C9Vsyq1urE254qLDZbxxw
 SsmhS9dYEyh5gudso3dWb6aqUTNjDthk9E2oviuhV3Y4cK3Kn3TtY50eLk4XmZmta90gVqzcYvZ
 FX6r/+0x5J2D91nw==
X-Received: by 2002:a17:903:32d0:b0:2cf:4504:feb5 with SMTP id
 d9443c01a7336-2cfde85f6acmr57490745ad.31.1785077498488; 
 Sun, 26 Jul 2026 07:51:38 -0700 (PDT)
Received: from localhost.localdomain ([82.40.42.115])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cfde81d7f5sm20934195ad.83.2026.07.26.07.51.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 26 Jul 2026 07:51:36 -0700 (PDT)
From: Jack Wang <163wangjack@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 qemu-rust@nongnu.org, caojunze424@gmail.com,
 Jack Wang <163wangjack@gmail.com>
Subject: [RFC PATCH v1 0/5] hw/gpio: STM32F1xx GPIO controller in Rust
Date: Sun, 26 Jul 2026 22:51:14 +0800
Message-ID: <20260726145119.19881-1-163wangjack@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=163wangjack@gmail.com; helo=mail-pl1-x62c.google.com
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

Hi all,

This RFC adds an STM32F1xx GPIO controller modelled in Rust, following the
existing rust/hw/char/pl011 device as a template. The register logic (CRL/CRH
mode+config decode and the IDR update algorithm) is a direct port of the C
model in hw/gpio/stm32l4x5_gpio.c; the STM32F1xx GPIO block (RM0008) is the
same IP used by the upstream stm32f100_soc.

This series is currently stacked on an out-of-tree STM32F103 SoC and board
that are not yet upstream which is https://github.com/shandianchengzi/qemu
But the commit(the initialize logic and gpio architecture) is both capable 
for stm32f100.This is the reason that struct name is  stm32f1xx. Patch 3 
("hw/arm/stm32f103: instantiate and mapGPIO ports") therefore touches files 
that do not exist in mainline and willnot apply cleanly on its own. 
I am sending this as an RFC to get feedback onthe Rust device model and 
its integration now, before the SoC lands, rather than as an apply-ready series
. Once the SoC is upstream (or if you I
can retarget the device at the existing stm32f100_soc), I will resend a
non-RFC series.

checkpatch reports SPDX warnings on Kconfig/trace-events/Cargo.toml/
meson.build and "MAINTAINERS need updating" on the new files. These are
false positives: matching rust/hw/char/pl011, these file types carry no SPDX
header in-tree, and MAINTAINERS already gains an entry covering rust/hw/gpio/
and the qtest in this series.

Anyway this is my first time to generate rust model build so sorry for some
mistakes. And any help or tip are welcomed

Jack Wang (5):
  hw/gpio: add stm32f1xx GPIO device model (Rust)
  rust: add hw/gpio crate to the workspace
  hw/arm/stm32f103: instantiate and map GPIO ports
  tests/qtest: add stm32f103 GPIO test
  rust/hw/gpio: add native unit tests

 MAINTAINERS                       |   7 +
 hw/arm/Kconfig                    |   1 +
 hw/arm/stm32f103_board.c          |   2 +-
 hw/arm/stm32f103_soc.c            |  54 ++-
 hw/gpio/Kconfig                   |   5 +
 hw/gpio/trace-events              |   7 +
 include/hw/arm/stm32f103_soc.h    |   9 +
 rust/Cargo.lock                   |  17 +-
 rust/Cargo.toml                   |  18 +
 rust/hw/Kconfig                   |   1 +
 rust/hw/gpio/Cargo.toml           |  28 ++
 rust/hw/gpio/Kconfig              |   2 +
 rust/hw/gpio/meson.build          |  54 +++
 rust/hw/gpio/src/bindings.rs      |  19 ++
 rust/hw/gpio/src/gpio.rs          | 539 ++++++++++++++++++++++++++++++
 rust/hw/gpio/src/lib.rs           |   3 +
 rust/hw/gpio/tests/tests.rs       | 191 +++++++++++
 rust/hw/meson.build               |   1 +
 tests/qtest/meson.build           |   4 +
 tests/qtest/stm32f103_gpio-test.c | 328 ++++++++++++++++++
 20 files changed, 1281 insertions(+), 9 deletions(-)
 create mode 100644 rust/hw/gpio/Cargo.toml
 create mode 100644 rust/hw/gpio/Kconfig
 create mode 100644 rust/hw/gpio/meson.build
 create mode 100644 rust/hw/gpio/src/bindings.rs
 create mode 100644 rust/hw/gpio/src/gpio.rs
 create mode 100644 rust/hw/gpio/src/lib.rs
 create mode 100644 rust/hw/gpio/tests/tests.rs
 create mode 100644 tests/qtest/stm32f103_gpio-test.c

-- 
2.53.0


