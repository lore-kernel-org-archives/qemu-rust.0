Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD04D116EA
	for <qemu-rust@archiver.kernel.org>; Sat, 29 Nov 2025 16:38:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vPNxs-0001Fs-VQ; Sat, 29 Nov 2025 11:38:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenmiao.ku@gmail.com>)
 id 1vPN6i-0001iX-Nz
 for qemu-rust@nongnu.org; Sat, 29 Nov 2025 10:43:32 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenmiao.ku@gmail.com>)
 id 1vPN6h-0007Zc-3q
 for qemu-rust@nongnu.org; Sat, 29 Nov 2025 10:43:32 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-343f52d15efso2535477a91.3
 for <qemu-rust@nongnu.org>; Sat, 29 Nov 2025 07:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764431009; x=1765035809; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5nSftTRhbYPZyAHoOCrUDgyrMu/ocklATRbEjkcpSxo=;
 b=HUr7n9QPC6BsjAgzzFu3swjZBZeL6kL0R2+0BmOIxACS0abVY5q1dlNX9rpeRPgTQL
 bM7tN/bWapDzT76PktAAJotE/dFLJ7uyGZYQjlS7stMwxhaTPln6HlNG+x0xH2Vy+Lh5
 TalXg2FmU57sHxFsrvOU17JERtCBl6qklZO9yBEqUNQCLeZ8p8rWi9OZr/GXOj5XfN/I
 Q9sZNx3Uui0YofL+BVXSs5RDdsyi48vUciSMlOAXwfqN7a1ZmDNTvFLnC304Ell4Nwg3
 u31qtDBM8EN1rXBOuIcDQATwlXRptVv+EcRkmwg7l+1+VwiZ9Dafo3EulEnc9CFCOjOD
 bfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764431009; x=1765035809;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5nSftTRhbYPZyAHoOCrUDgyrMu/ocklATRbEjkcpSxo=;
 b=RTgP7S+gmdHKu7up9eMlaE1NpkJ/40wbGPnPIEnGx1nOtvbB1AFZHvsYSNrN22M0Yg
 MYFeLrMbrPBRKzl5yzL9+qk7ADBecjB79/4UZXZ+M7vt2vI05+y2+di/VkQlqDssTxH6
 80HFq0brJ9Idyh2cXBMKutURUdKuFSwpO8BYROpyHv0rp+ntwMF2P7mIjkFgu9Np9gbN
 6/bmv95Z4tndHrqNcUKflRxQVr7hB5ipZ0wkDYHkG4iTKFVgWHqa7upI9McI8JMmj8F/
 wgVhSRCl2aQ0s+c3O5OX4LFobu2dl2XSYuDNxGFmDXuSMqIKaAWkYEe7ddPHuRtt7/Tu
 htcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLCi6/Nu5Dvs5zmAGAyinAQrrwavkiZA+ScUaqNU4Qg8D5xyVw8uWcTv93hxs59AZLqYtpCGmclNQ=@nongnu.org
X-Gm-Message-State: AOJu0YyPURol7E/+BE84iPrfT6dq4UEZ1z9702HC9ap3yavUNmEV8fvK
 Podhqt8CrRiAI8TE0CjGj/KYlGyAKs8In54tLl4999nOy/msPwZ0PjYc
X-Gm-Gg: ASbGncvY1udCW6AxRSt4KdL+6CJdc6gw9z7e8wSP1n6Bt7weQALFwWDugBWaM1dJp1q
 WOl+cbFk5NaBXj0s3pECMSgfaPtuNCOv095TcimpFeP86UQwojFw0KRmtvaUC8eSeNoOudhb0E7
 fwrYicF4sC8byWFjud99gwLf8X2vLNHcAVC4MOX0ZPUYTxQ9vJS54R8bN1Y9hXL9BzuLf/lHQjO
 ffL+8Y2M+qFE5g81yDUQ+g6hvRU2S4EMIY80qg5YS/bnFbpTNj13wBcqWhEOK+2OgF9GNcwekpN
 qPAYnpjdfJ8r5ubbltxaivjC+AEqO+bo90Dh6UFjuX6VAjWZQXQsGQk4IHXL0M7HRfLHxCKpcmJ
 CnHxvncgqKLYQx60LsaHNalnUjtu/VWQCNZqSF6uCAqgUMCtoEDTEKHblL3mYq8/Wyqf2colGKT
 8Yw+taDZcQVMdMbWAzrkrbOKhrNoVxLbRDv9yj0jyVLIhi34eeAI3jV1rI
X-Google-Smtp-Source: AGHT+IHHL5ZmRNp1NMFjTfm3b3TSsb9Qi0gL+rxXqSijfgsmhnkf7D+JxcxyxSMqUfK/XAPpyeK2Lg==
X-Received: by 2002:a17:90b:54cd:b0:32e:3552:8c79 with SMTP id
 98e67ed59e1d1-3475ed6a4f9mr20375585a91.29.1764431009115; 
 Sat, 29 Nov 2025 07:43:29 -0800 (PST)
Received: from nyaos.localdomain ([166.0.199.48])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3476a546ed0sm11799767a91.3.2025.11.29.07.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Nov 2025 07:43:28 -0800 (PST)
From: ChenMiao <chenmiao.ku@gmail.com>
To: zhao1.liu@intel.com, pbonzini@redhat.com, manos.pitsidianakis@linaro.org,
 richard.henderson@linaro.org, philmd@linaro.org
Cc: chao.liu@openatom.club , dzm91@openatom.club , qemu-rust@nongnu.org,
 qemu-devel@nongnu.org, hust-os-kernel-patches@googlegroups.com,
 Chen Miao <chenmiao@openatom.club>
Subject: [RESEND RFC PATCH V3 0/4] rust/hw: Add the I2C and the first GPIO
 device
Date: Sat, 29 Nov 2025 15:43:17 +0000
Message-ID: <cover.1764426204.git.chenmiao@openatom.club>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=chenmiao.ku@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 29 Nov 2025 11:38:21 -0500
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
Message-ID: <20251129154317.Y3Ltw-zSfrhheY2s6yShR8I4H3a2sqbSg50IHDBsPOc@z>

From: Chen Miao <chenmiao@openatom.club>

We have implemented I2C and the first GPIO device in Rust for QEMU.
Additionally, in the respective patches, we have shared our insights and
experiences regarding the use of Rust for device modeling within QEMU.

1. The first patch implements the BusState for the I2CBus infrastructure.
2. The second patch implements the I2CBus and I2CSlave infrastructure, along
   with a discussion of the challenges encountered during the implementation.
3. The third patch provides a set of necessary helper functions for the PCF8574
   GPIO device.
4. The fourth patch implements the PCF8574 GPIO device, along with a discussion
   of the issues and considerations addressed during the implementation.

Signed-off-by: Chen Miao <chenmiao@openatom.club>
Signed-off-by: Chao Liu <chao.liu@openatom.club>

chenmiao (4):
  rust/hw/core: Add the BusState of rust version
  rust/hw/core: Add rust bindings/funcs for i2c bus
  rust/hw/core: Provide some interfaces for the GPIO device
  rust/hw/gpio: Add the the first gpio device pcf8574

 hw/gpio/Kconfig                  |   5 +
 hw/gpio/meson.build              |   2 +-
 rust/Cargo.lock                  |  18 +-
 rust/Cargo.toml                  |   1 +
 rust/hw/Kconfig                  |   1 +
 rust/hw/core/meson.build         |   2 +
 rust/hw/core/src/bus.rs          |  44 +++++
 rust/hw/core/src/i2c.rs          | 303 +++++++++++++++++++++++++++++++
 rust/hw/core/src/lib.rs          |   6 +
 rust/hw/core/src/qdev.rs         |  17 +-
 rust/hw/core/wrapper.h           |   1 +
 rust/hw/gpio/Kconfig             |   2 +
 rust/hw/gpio/meson.build         |   1 +
 rust/hw/gpio/pcf8574/Cargo.toml  |  28 +++
 rust/hw/gpio/pcf8574/meson.build |  37 ++++
 rust/hw/gpio/pcf8574/src/lib.rs  | 178 ++++++++++++++++++
 rust/hw/meson.build              |   1 +
 17 files changed, 642 insertions(+), 5 deletions(-)
 create mode 100644 rust/hw/core/src/bus.rs
 create mode 100644 rust/hw/core/src/i2c.rs
 create mode 100644 rust/hw/gpio/Kconfig
 create mode 100644 rust/hw/gpio/meson.build
 create mode 100644 rust/hw/gpio/pcf8574/Cargo.toml
 create mode 100644 rust/hw/gpio/pcf8574/meson.build
 create mode 100644 rust/hw/gpio/pcf8574/src/lib.rs

-- 
2.43.0


