Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB9FCCF9EE
	for <qemu-rust@archiver.kernel.org>; Tue, 28 Oct 2025 10:21:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vDgoq-0005tn-TX; Tue, 28 Oct 2025 06:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenmiao@openatom.club>)
 id 1vDgoF-0005aJ-EC
 for qemu-rust@nongnu.org; Tue, 28 Oct 2025 06:20:15 -0400
Received: from sg-1-14.ptr.blmpb.com ([118.26.132.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenmiao@openatom.club>)
 id 1vDgo0-0001sB-Jc
 for qemu-rust@nongnu.org; Tue, 28 Oct 2025 06:20:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1761646713;
 h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=5jaYdlz9cq3d+ZqdMwPs227DOqydqYv4NqJ56w4RRj8=;
 b=Sd+m1qX0E9KA79QmaJaDexlJwzVRc6OTVPin5POB9vaLIjyAte7utE3CJ01PErbCud5c3k
 fNRQG1MJKHKo0gnxVQtHdbBJ1AdOnKTS0RHu5zOmxtAbQLW6WApi8qC8Rd9ttPUtAdOh84
 7lBW3jf76lUgOlIahbKyyHtJTbJtXNVJvQwWUtLiOq7Aydzi7iEI3AwlM41UaHHBd2mka1
 yg6+uXpXJRX3wpAs6R4gALKe56ahKXvWQzDRZCRafISOF+dUUoUKx717n2z2ZkueahOUpf
 7vVYuVIvMVCG3fbYsPaWCF/y2KRUBiCzKMMFxQ+pjkRA5uldKz57n3aueVSZAA==
X-Original-From: chenmiao <chenmiao@openatom.club>
Content-Transfer-Encoding: 7bit
Cc: <chao.liu@openatom.club>, <qemu-rust@nongnu.org>, 
 <qemu-devel@nongnu.org>, <hust-os-kernel-patches@googlegroups.com>, 
 "Chen Miao" <chenmiao@openatom.club>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+269009877+9b2c85+nongnu.org+chenmiao@openatom.club>
To: <zhao1.liu@intel.com>, <pbonzini@redhat.com>, 
 <manos.pitsidianakis@linaro.org>, <richard.henderson@linaro.org>, 
 <philmd@linaro.org>
Subject: [RFC PATCH v2 0/5] rust/hw: Add the I2C and the first GPIO device
Message-Id: <cover.1761644606.git.chenmiao@openatom.club>
Received: from nyaos.localdomain ([114.249.194.57]) by smtp.feishu.cn with
 ESMTPS; Tue, 28 Oct 2025 18:18:30 +0800
From: "chenmiao" <chenmiao@openatom.club>
Date: Tue, 28 Oct 2025 10:18:24 +0000
Mime-Version: 1.0
Received-SPF: pass client-ip=118.26.132.14;
 envelope-from=chenmiao@openatom.club; helo=sg-1-14.ptr.blmpb.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We have implemented I2C and the first GPIO device in Rust for QEMU.
Additionally, in the respective patches, we have shared our insights and
experiences regarding the use of Rust for device modeling within QEMU.

1. The first patch implements the BusState for the I2CBus infrastructure.
2. The second patch implements the I2CBus and I2CSlave infrastructure, along
   with a discussion of the challenges encountered during the implementation.
3. The third patch moves the struct definition of the PCF8574 to the
   corresponding header file.
4. The fourth patch provides a set of necessary helper functions for the PCF8574
   GPIO device.
5. The fifth patch implements the PCF8574 GPIO device, along with a discussion
   of the issues and considerations addressed during the implementation.

Regarding this series of patches, we have found that Rust for QEMU is indeed
still not mature enough and requires continuous iteration. Additionally, the
lack of basic documentation also needs to be addressed. In this regard, I hope
our team(HUST OpenAtom Open Source Club) can contribute to the documentation
efforts for Rust for QEMU.

Link: https://groups.google.com/g/hust-os-kernel-patches/c/z7vHWg3xvDc

Signed-off-by: Chao Liu <chao.liu@openatom.club>
Signed-off-by: Chen Miao <chenmiao@openatom.club>

---
Changes in V2:
  - According to Zhao's suggestions, some modifications were made to the first
    and second patches respectively, such as changing some bus names, adding
    some Safety comments, and adding callbacks for I2CSlave.
  - While we were making changes to the first PATCH, Chao Liu pointed out that
    the realize function was unnecessary in the bus. After discussion, we
    removed the bus::realize function. Since no other components are currently
    using the bus, we added a TODO comment for clarification.

chenmiao (5):
  rust/hw/core: Add the BusState of rust version
  rust/hw/core: Add rust bindings/funcs for i2c bus
  hw/gpio: Move the pcf8574 struct to header
  rust/hw/core: Provide some interfaces for the GPIO device
  rust/hw/gpio: Add the the first gpio device pcf8574

 hw/gpio/Kconfig                      |   5 +
 hw/gpio/meson.build                  |   2 +-
 hw/gpio/pcf8574.c                    |  32 --
 include/hw/gpio/pcf8574.h            |  36 +++
 rust/Cargo.lock                      |  21 +-
 rust/Cargo.toml                      |   1 +
 rust/hw/Kconfig                      |   1 +
 rust/hw/core/meson.build             |   2 +
 rust/hw/core/src/bus.rs              |  44 +++
 rust/hw/core/src/i2c.rs              | 421 +++++++++++++++++++++++++++
 rust/hw/core/src/irq.rs              |   6 +-
 rust/hw/core/src/lib.rs              |   6 +
 rust/hw/core/src/qdev.rs             |  12 +-
 rust/hw/core/wrapper.h               |   1 +
 rust/hw/gpio/Kconfig                 |   2 +
 rust/hw/gpio/meson.build             |   1 +
 rust/hw/gpio/pcf8574/Cargo.toml      |  31 ++
 rust/hw/gpio/pcf8574/build.rs        |   1 +
 rust/hw/gpio/pcf8574/meson.build     |  50 ++++
 rust/hw/gpio/pcf8574/src/bindings.rs |  29 ++
 rust/hw/gpio/pcf8574/src/device.rs   | 180 ++++++++++++
 rust/hw/gpio/pcf8574/src/lib.rs      |   4 +
 rust/hw/gpio/pcf8574/wrapper.h       |  51 ++++
 rust/hw/meson.build                  |   1 +
 24 files changed, 902 insertions(+), 38 deletions(-)
 create mode 100644 rust/hw/core/src/bus.rs
 create mode 100644 rust/hw/core/src/i2c.rs
 create mode 100644 rust/hw/gpio/Kconfig
 create mode 100644 rust/hw/gpio/meson.build
 create mode 100644 rust/hw/gpio/pcf8574/Cargo.toml
 create mode 120000 rust/hw/gpio/pcf8574/build.rs
 create mode 100644 rust/hw/gpio/pcf8574/meson.build
 create mode 100644 rust/hw/gpio/pcf8574/src/bindings.rs
 create mode 100644 rust/hw/gpio/pcf8574/src/device.rs
 create mode 100644 rust/hw/gpio/pcf8574/src/lib.rs
 create mode 100644 rust/hw/gpio/pcf8574/wrapper.h

-- 
2.43.0

