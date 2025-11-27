Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5DAD11183
	for <qemu-rust@archiver.kernel.org>; Thu, 27 Nov 2025 13:21:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vObw2-00061P-I3; Thu, 27 Nov 2025 08:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vObvU-0005MR-8p
 for qemu-rust@nongnu.org; Thu, 27 Nov 2025 08:20:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vObvQ-00023d-9K
 for qemu-rust@nongnu.org; Thu, 27 Nov 2025 08:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764249642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=u17RIjjVp6LXVD3gf84zUaaFlYVW+8dZ+Pm0JVHMJA8=;
 b=KBICXY5F1/LgK/ys0Dh14yMey41isa+70Wxrv1EroLhp0aeJD1Bt64hMG0fcAjSeZjXPES
 bVHe9oL6HuCB6tiBzGYZoIrERi9Fuuzm4bTVu9x6RFsfrIRZ2HIIxeYPdgd7C6cXwwlqe3
 iHQCfvPrC/lBCWfa9dwig9OOsADWCMw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-LC9CVby8NtSRbOE_VViusg-1; Thu, 27 Nov 2025 08:20:40 -0500
X-MC-Unique: LC9CVby8NtSRbOE_VViusg-1
X-Mimecast-MFC-AGG-ID: LC9CVby8NtSRbOE_VViusg_1764249640
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b72a95dc686so72058566b.3
 for <qemu-rust@nongnu.org>; Thu, 27 Nov 2025 05:20:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764249638; x=1764854438;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u17RIjjVp6LXVD3gf84zUaaFlYVW+8dZ+Pm0JVHMJA8=;
 b=Uz/CQh0sidJ5rHSVKAbCnChJMSn4npWere9dZhuiLT7kLLTPsCGdoOQuWIU/t+6KAu
 Nl4hJhDPtovykahVfTSsftIOYIh9H3YMehxJ3TEe/hL4gapO8zII2vtVG5tTMSIDKGNb
 q9G+bgIU6+XgSB6nF8ZA2A0wLetuaeqr+TkToCiaYgor4yO+OETUvClGaROImejryCcY
 a1uno4oxOI6wjW83nHfLiRAvX1AGXqMZVD2eMQNXnJxi+AUz+rs8YUHs2XAI6PTHRIwj
 Hnua+t9VZdswmOGni9oh+6a0ETqCs6jV8DDwx43W3XY50IDTKb86DbTPIbkZVyDv4wva
 Z/9Q==
X-Gm-Message-State: AOJu0Yxrz/7ABnSnkXTghu69qtvOMH5PhDKmi/adVrXrhzqcq54EXX/r
 M3uUe5fPMBKXllZU6BJNlGoZSBwJFQGTtZcq61Z1ZFUlH7yrQR8llHMNHwLOePsz0HQ/JfFyRG7
 lZZXh6df29wHq/GcxjqCeWJRyCdkTnDZhVnRQTVX0HNbSdbGSNdIoCNbW382e+LQ=
X-Gm-Gg: ASbGncuJclz6pJcYWaC4LBsmnk0NSsgGIYsciKzT5fDEtzI++WLnYroXtjk4y2E5JTq
 yo7O0qZ9SSzmgtl8rxiG0qpNmpNLJPfIqPiTLQEk55wv1FfYBzEmCRBahXXVNvTG50dsWNxOElm
 NVSDJxvC15H7Ip0SSPrSzs7McYQw2k2PzInZegca56VsK0LsTrGpS/Yaedct2RbeQjaLeCRs/dy
 xOGMnDIPGYzGccM4zOUDfRAEqv0NmXEggFg+WR1kGNvkjT5Kazg2GtEFwJSdIP9V5qKhoyNvwhS
 VkXVmMSR/QG6Rr97ptdo4m80cbNqfPlBAHM3I5D5fbJNI04YDNpXiVa2Op8tLwKFC9qqP2G9BPP
 rwCilTb2fI9abYpgIMqMrE3o6+8s8Fz6v9a7MggQrunvKj3jiYH2Mdy4MlIqy8m+TcalimtFxk0
 4Km9a6YeeiP74rXH0=
X-Received: by 2002:a05:6402:280a:b0:640:93b2:fd0a with SMTP id
 4fb4d7f45d1cf-645eb296885mr9769224a12.20.1764249638456; 
 Thu, 27 Nov 2025 05:20:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiwxgu70lAYL36dx9Gs9DhP+ATOKfmsqnXj1moZFmWErzSFwQXcoYyKjz1Z4DYeF2xauzGYg==
X-Received: by 2002:a05:6402:280a:b0:640:93b2:fd0a with SMTP id
 4fb4d7f45d1cf-645eb296885mr9769192a12.20.1764249638068; 
 Thu, 27 Nov 2025 05:20:38 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64751061e60sm1603926a12.32.2025.11.27.05.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 05:20:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 0/9] rust: build system and other cleanups
Date: Thu, 27 Nov 2025 14:20:27 +0100
Message-ID: <20251127132036.84384-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gIJfXlwm-Q34momprLBdQPjfQlhxNNyHg05KnL_8AyU_1764249640
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.224,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

A few small changes that I accumulated or received from others.

Paolo

Marc-André Lureau (1):
  rust: remove leftover bindings/

Martin Kletzander (1):
  rust: Do not link qemuutil into Rust rlibs

Paolo Bonzini (7):
  rust: remove unused --cfg arguments
  rust: remove unnecessary repetitive options
  rust/bql: make bindings public
  rust: do not copy the SysBusDevice
  rust: fix reference to MemoryRegion
  rust: move strict lints handling to meson.build
  rust: only link the Rust part of the code into devices

 meson.build                                   | 10 +--
 rust/bindings/src/lib.rs                      | 64 -------------------
 rust/bits/meson.build                         |  2 -
 rust/bql/meson.build                          |  2 -
 rust/bql/src/cell.rs                          |  2 +-
 rust/bql/src/lib.rs                           |  2 +-
 rust/chardev/meson.build                      |  4 +-
 rust/common/meson.build                       |  2 -
 rust/hw/char/pl011/meson.build                | 18 +++---
 rust/hw/core/src/sysbus.rs                    |  2 +-
 rust/hw/timer/hpet/meson.build                | 16 ++---
 rust/migration/meson.build                    |  2 -
 rust/qemu-macros/meson.build                  |  6 --
 rust/qom/meson.build                          |  4 +-
 rust/system/meson.build                       |  2 -
 rust/tests/meson.build                        |  1 -
 rust/trace/meson.build                        |  2 -
 rust/util/meson.build                         |  6 +-
 scripts/rust/rustc_args.py                    | 20 +-----
 .../bilge-impl-0.2-rs/meson.build             |  3 -
 .../proc-macro-error-1-rs/meson.build         |  1 -
 .../proc-macro-error-attr-1-rs/meson.build    |  3 -
 22 files changed, 32 insertions(+), 142 deletions(-)
 delete mode 100644 rust/bindings/src/lib.rs

-- 
2.51.1


