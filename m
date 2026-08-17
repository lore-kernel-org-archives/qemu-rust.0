Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7530BC5DF66
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Aug 2026 13:46:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wvxeu-0003L0-J3; Mon, 17 Aug 2026 09:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wvxer-0003KA-7u
 for qemu-rust@nongnu.org; Mon, 17 Aug 2026 09:45:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wvxep-0001wL-Bj
 for qemu-rust@nongnu.org; Mon, 17 Aug 2026 09:45:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1786974342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GevxyuWn8FuBdYTpxPvpYbIo5BMMWCibwO+Cr6MbZNc=;
 b=YSVh32vFfiXH0ef3Ukj2lFG98CUscDON53FqhQbUijX0A9xHeQZM6ldSNBYv95xPeUzf8t
 ojEwh4n+rLp9pV6TPgjSX9ZnYo3YsZqn+8abrBsco3+LAGirlrLuWUxSDmsxiu3lKycF7T
 w7nqPRnOuUFo+zlhBkpCm4wcJP5TPkw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-QQV0o9TgNwCVWqWU9UsfQA-1; Mon, 17 Aug 2026 09:45:41 -0400
X-MC-Unique: QQV0o9TgNwCVWqWU9UsfQA-1
X-Mimecast-MFC-AGG-ID: QQV0o9TgNwCVWqWU9UsfQA_1786974340
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4997b060af8so20660755e9.1
 for <qemu-rust@nongnu.org>; Mon, 17 Aug 2026 06:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786974340; x=1787579140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GevxyuWn8FuBdYTpxPvpYbIo5BMMWCibwO+Cr6MbZNc=;
 b=G6DdJCPvY7zpICWw77nVEK4TWDYNJinRnmxeFUAUcziZeFE4Xn2jb6wQ73nKM8mpuN
 BOEIPYZeAbJ36lbe4O4W4Lql5lR35+cUmBBqBSw8ZqZMBvkpwOJ+/drwvH6WYJJGv5pt
 fNW6FSbKff4uvZ+Etwn6KRGJjGndbQRa1XMPdz6488Ynn0MtbQHF/+GBT27EcQyB0XI6
 BnthX40WeozFMOXVcoxqbzd5g1rXP44olTqQqNvrvSXFx7kgl5o1tlK/fEMwr2Qh7PuK
 sK07nFSkEtB4HxqMIr/P42gFDIXKN1GoKMHit3rJHsWw/Y7YGqNegW9ocqBjaSC1daqk
 7haA==
X-Gm-Message-State: AOJu0Yy7q+IaBIbjJ/bCzn0JhoGllTLtVh56mbqnrcXy5z/lQSHCi3ni
 UF66z0nluilO9e+s2qgjjD2kVzI05yyiMdRMohL+L0KK+Vb6JLLvOtZvddHJhXKd2Fi9kXoCOPs
 AMNK2puhiJ9I6YCk7VVxziLooGMtRSP7ZORI4IJvVVzIjdzykwmjGrOWoVRdAM+8=
X-Gm-Gg: AR+sD11rEdficaT2T75bzkTaCWeXsfykARln8m3Vz0eJKXKrl9KUa7/U1bd8jZmTKkK
 QGD61lKrCzpG7JepNqQ+1yrfJyuXPMKYnZpBFP6zHYMvrBS2rsII1FMTyRy7ICqIei44sqRw32m
 kqSD4ay8DVGssejOvxMGnGP7GQWYDQxfUHkKoWtt1qz8fWH2HI4On71VVfDhK3/dajbW4iKfzwj
 KCAYhoZ3PRaq5ogp0kG2pEaWLTjRWvQi4mVCimc5yM7nnbiM7qU1L+m+On/cAls5qyGIgcEHIu5
 UobTx3//RlOwSt0w70xPnr04xdLmRjplEBtlrAWYMGbxuRKr0xT24y9HA8EdJtpwN9Cv/QsczCQ
 s+RB87NvrdmveQprXfyDpSn4MVi39AZDPmpYTMlLB4yF7BUdS3qQMX7YuXufKbcEF
X-Received: by 2002:a05:600c:5307:b0:499:8c68:a3aa with SMTP id
 5b1f17b1804b1-4998c68a830mr386440845e9.13.1786974339832; 
 Mon, 17 Aug 2026 06:45:39 -0700 (PDT)
X-Received: by 2002:a05:600c:5307:b0:499:8c68:a3aa with SMTP id
 5b1f17b1804b1-4998c68a830mr386439905e9.13.1786974339402; 
 Mon, 17 Aug 2026 06:45:39 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.34.92])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d06167csm43831385e9.3.2026.08.17.06.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 06:45:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 0/9] First batch of Rust changes for QEMU 11.2
Date: Mon, 17 Aug 2026 15:45:28 +0200
Message-ID: <20260817134538.924615-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k1uweGqtJdaTi1H47Xc5QapsihZ-UP9op4z0d7PZshA_1786974340
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.343,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This finally brings in a version of Meson where Cargo subprojects are
powerful enough to remove large parts of QEMU's handwritten build rules
of scripts/rust/rustc_args.py.  In particular this includes the following
Meson features

- usage of a single Cargo.lock to resolve crate versions (1.10.0)

- support for Cargo workspaces (also 1.10.0)

- parsing of Cargo.toml files from QEMU to resolve features (1.11.0
  and patch 3)...

- ... and to simplify build rules (also 1.11.0, and patch 4)

- build-machine subprojects for cross-compilation scenarios (1.12.0)

In other words, this finally realizes the plan from 2024 of using Cargo
subprojects to build dependent crates, aka the reason why QEMU isn't
invoking Cargo like many other projects do (such as libblkio).

The introduction of Cargo subprojects would also allow in principle
to build libigvm and as part of QEMU itself.  To this end Meson
1.12.0 also simplifies the invocation of cbindgen, which libigvm
uses as part of its build process.

Paolo

Based-on: <20260817134313.922754-1-pbonzini@redhat.com>

Paolo Bonzini (9):
  python, meson: update meson required for Rust to 1.12.0
  rust: update Cargo.lock
  rust: switch to cargo subprojects
  rust: switch to autogenerated meson rules
  meson: use compiler_target() to get rustc target
  rust: use meson automatic parsing of Cargo.toml
  docs: rust: update for new-style build rules
  scripts: remove now dead parts of rustc_args.py
  rust: update Cargo dependencies

 docs/devel/rust.rst                           |  85 ++++++-----------
 configure                                     |   7 +-
 meson.build                                   |  16 ++--
 .gitlab-ci.d/static_checks.yml                |   4 +-
 rust/Cargo.lock => Cargo.lock                 |  87 ++++++++----------
 rust/Cargo.toml => Cargo.toml                 |   6 +-
 python/scripts/vendor.py                      |   4 +-
 python/wheels/meson-1.11.1-py3-none-any.whl   | Bin 1078534 -> 0 bytes
 python/wheels/meson-1.12.0-py3-none-any.whl   | Bin 0 -> 1106208 bytes
 pythondeps.toml                               |   4 +-
 rust/bindings/chardev-sys/meson.build         |  11 +--
 rust/bindings/hwcore-sys/meson.build          |  11 +--
 rust/bindings/migration-sys/meson.build       |  11 +--
 rust/bindings/qom-sys/meson.build             |  11 +--
 rust/bindings/system-sys/meson.build          |  11 +--
 rust/bindings/util-sys/meson.build            |  11 +--
 rust/bits/meson.build                         |   7 +-
 rust/bql/meson.build                          |  13 +--
 rust/chardev/meson.build                      |   8 +-
 rust/common/meson.build                       |  10 +-
 rust/hw/char/pl011/meson.build                |  22 +----
 rust/hw/core/meson.build                      |  10 +-
 rust/hw/timer/hpet/meson.build                |  17 +---
 rust/meson.build                              |  26 +-----
 rust/migration/meson.build                    |   8 +-
 rust/qemu-macros/meson.build                  |  12 +--
 rust/qom/meson.build                          |   8 +-
 rust/system/meson.build                       |   8 +-
 rust/trace/meson.build                        |   9 +-
 rust/util/meson.build                         |   7 +-
 scripts/get-wraps-from-cargo-registry.py      |   6 --
 scripts/rust/rustc_args.py                    |  80 +---------------
 subprojects/anyhow-1-rs.wrap                  |   5 +-
 subprojects/arbitrary-int-1-rs.wrap           |   3 +-
 subprojects/attrs-0.2-rs.wrap                 |   3 +-
 subprojects/bilge-0.2-rs.wrap                 |   3 +-
 subprojects/bilge-impl-0.2-rs.wrap            |   3 +-
 subprojects/either-1-rs.wrap                  |   3 +-
 subprojects/foreign-0.3-rs.wrap               |   3 +-
 subprojects/glib-sys-0.21-rs.wrap             |   3 +-
 subprojects/itertools-0.11-rs.wrap            |   3 +-
 subprojects/libc-0.2-rs.wrap                  |   5 +-
 .../packagefiles/anyhow-1-rs/meson.build      |  33 -------
 .../anyhow-1-rs/meson/meson.build             |   9 ++
 .../arbitrary-int-1-rs/meson.build            |  21 -----
 .../packagefiles/attrs-0.2-rs/meson.build     |  33 -------
 .../packagefiles/bilge-0.2-rs/meson.build     |  31 -------
 .../bilge-impl-0.2-rs/meson.build             |  44 ---------
 .../packagefiles/either-1-rs/meson.build      |  26 ------
 .../packagefiles/foreign-0.3-rs/meson.build   |  26 ------
 .../packagefiles/glib-sys-0.21-rs/meson.build |  33 -------
 .../itertools-0.11-rs/meson.build             |  32 -------
 .../packagefiles/libc-0.2-rs/meson.build      |  37 --------
 .../libc-0.2-rs/meson/meson.build             |  16 ++++
 .../packagefiles/probe-0.5-rs/meson.build     |  22 -----
 .../proc-macro-error-1-rs/meson.build         |  41 ---------
 .../proc-macro-error-1-rs/meson/meson.build   |   3 +
 .../proc-macro-error-attr-1-rs/meson.build    |  31 -------
 .../packagefiles/proc-macro2-1-rs/meson.build |  35 -------
 .../proc-macro2-1-rs/meson/meson.build        |   6 ++
 .../packagefiles/quote-1-rs/meson.build       |  31 -------
 subprojects/packagefiles/syn-2-rs/meson.build |  43 ---------
 .../unicode-ident-1-rs/meson.build            |  22 -----
 subprojects/probe-0.5-rs.wrap                 |   3 +-
 subprojects/proc-macro-error-1-rs.wrap        |   4 +-
 subprojects/proc-macro-error-attr-1-rs.wrap   |   3 +-
 subprojects/proc-macro2-1-rs.wrap             |   4 +-
 subprojects/quote-1-rs.wrap                   |   3 +-
 subprojects/syn-2-rs.wrap                     |   3 +-
 subprojects/unicode-ident-1-rs.wrap           |   3 +-
 70 files changed, 194 insertions(+), 968 deletions(-)
 rename rust/Cargo.lock => Cargo.lock (85%)
 rename rust/Cargo.toml => Cargo.toml (97%)
 delete mode 100644 python/wheels/meson-1.11.1-py3-none-any.whl
 create mode 100644 python/wheels/meson-1.12.0-py3-none-any.whl
 delete mode 100644 subprojects/packagefiles/anyhow-1-rs/meson.build
 create mode 100644 subprojects/packagefiles/anyhow-1-rs/meson/meson.build
 delete mode 100644 subprojects/packagefiles/arbitrary-int-1-rs/meson.build
 delete mode 100644 subprojects/packagefiles/attrs-0.2-rs/meson.build
 delete mode 100644 subprojects/packagefiles/bilge-0.2-rs/meson.build
 delete mode 100644 subprojects/packagefiles/bilge-impl-0.2-rs/meson.build
 delete mode 100644 subprojects/packagefiles/either-1-rs/meson.build
 delete mode 100644 subprojects/packagefiles/foreign-0.3-rs/meson.build
 delete mode 100644 subprojects/packagefiles/glib-sys-0.21-rs/meson.build
 delete mode 100644 subprojects/packagefiles/itertools-0.11-rs/meson.build
 delete mode 100644 subprojects/packagefiles/libc-0.2-rs/meson.build
 create mode 100644 subprojects/packagefiles/libc-0.2-rs/meson/meson.build
 delete mode 100644 subprojects/packagefiles/probe-0.5-rs/meson.build
 delete mode 100644 subprojects/packagefiles/proc-macro-error-1-rs/meson.build
 create mode 100644 subprojects/packagefiles/proc-macro-error-1-rs/meson/meson.build
 delete mode 100644 subprojects/packagefiles/proc-macro-error-attr-1-rs/meson.build
 delete mode 100644 subprojects/packagefiles/proc-macro2-1-rs/meson.build
 create mode 100644 subprojects/packagefiles/proc-macro2-1-rs/meson/meson.build
 delete mode 100644 subprojects/packagefiles/quote-1-rs/meson.build
 delete mode 100644 subprojects/packagefiles/syn-2-rs/meson.build
 delete mode 100644 subprojects/packagefiles/unicode-ident-1-rs/meson.build

-- 
2.55.0


