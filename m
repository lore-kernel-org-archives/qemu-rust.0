Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10E5CE8D6B
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Nov 2025 07:44:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vKttj-0003Xt-6b; Mon, 17 Nov 2025 02:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKtsx-0003Ri-B8
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 02:42:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKtsu-0005un-Nr
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 02:42:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763365367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A3DOmTTtUlRI29oyMtkqRVQpm1BCXvndErwb6vVQTDc=;
 b=BMEDirMjV8FymV9TnCXbFWMG4Tl+L6XwxdFSC1cXkPGn1HW60etbrLKIzL9hVWDXbf0cvL
 p1nXZyPr5FLyFsUBypoK7altYR8yg8fpLyszPebaPkemcNgxdEzhXdwF785QJmn2w8bdX7
 dc9iYqXUFMlyILwbJmciiBXGZZyZMX0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-nE7aN-goP4Ok9bXSX4pHrg-1; Mon, 17 Nov 2025 02:42:46 -0500
X-MC-Unique: nE7aN-goP4Ok9bXSX4pHrg-1
X-Mimecast-MFC-AGG-ID: nE7aN-goP4Ok9bXSX4pHrg_1763365365
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4779da35d27so10053235e9.3
 for <qemu-rust@nongnu.org>; Sun, 16 Nov 2025 23:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763365364; x=1763970164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=A3DOmTTtUlRI29oyMtkqRVQpm1BCXvndErwb6vVQTDc=;
 b=s/tB/Isj8CDOuUloIrpdIvpVd54GHAV24Q96HDQcRLfLVQgToruKcscDtFqRu+SVqw
 Mw2sRBiuBSfm+3VmnxZea3LM/pxEr3azSsLxzvloztda3/wKYjMyZJ0O7Z2agjav4D/s
 OyRwUSwtJ5+7Qa4BQFq0gls7RYVfYVSo/HTnhaiwCUImiax8h9R3+FG6++JLmPOfkdD5
 fTVum3t/TQ5SiKGzNoHhorIxSMKvnIKQXUwbW4n8r95jVX/ikWBoBO1e0mu30zzFrgmZ
 FiOtoCNbACL93JsWdMORRuBBCSdn1dBxPrqp4XlPbbVVn4rDsi/vwpQnlgp3AalIg8OK
 DtHw==
X-Gm-Message-State: AOJu0YyrFU4p+WEyhoZ4udoEKS4d0P/kzxOn0CnYIYz3nCoHfRly/FrP
 7IBhyBFxm+0t8ITDHW1FDpn+5yf1kVcDyhZI6dBiTw/CToz+5QcG4OGJuABNE9Q9vjCL8SL0nav
 Q1qDl2Meu6bwETCgKuPgcDwNvRF2kcfEZFGBTdxjjKAIsKr0EWuYpOBROuiJpsl0=
X-Gm-Gg: ASbGnct8imfwf6+Icyd93pZ4BCExKHYN8FvOtXU1jJuMtNvXfndgP2x6YSfH12RxiR5
 ZNsTaF3j7uucHqm9pqUTboaWPgCUCPOIELwe4ZnevRZwmQG3zoWH77LMfR2hAH8xescUvnXnegj
 KA56pOKyt1W6hnTfJ7XxT7j6niexN5gVmH4jsTPrN6hHyiE86x+lP1kKHxSZBmlhETKyNCJLUP5
 D8wCKntQpmgSiM+Vaz8lUFFTyVIkJuacTNLSBt1vloAoeyzUWZ0mFSzCYqnxzodRzoXkKbrjZuH
 OVOI7OxbJmNjEjA36epsQuhdejwNhRmabCWaxQa0GCGGqyC50/mcU+b21y8GRhKDzry1vzkuAzC
 pmedjjUnETQCJCK7P09qJCLhA0bILQQyHU+LGzWlRNzatj3fhuW0yqaR7OPoMeHkVuRjRZFMG9V
 KQQYCl
X-Received: by 2002:a05:600c:c4a1:b0:475:dd7f:f6cd with SMTP id
 5b1f17b1804b1-4778fe96c46mr94795735e9.35.1763365364167; 
 Sun, 16 Nov 2025 23:42:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSxxfwKIqmVC45rPVAwvXfEMRLb+nGUQiQ9mYHEyIDE8dNbU1NYcZ49MsAqNBzM+bIaH1UnQ==
X-Received: by 2002:a05:600c:c4a1:b0:475:dd7f:f6cd with SMTP id
 5b1f17b1804b1-4778fe96c46mr94795525e9.35.1763365363713; 
 Sun, 16 Nov 2025 23:42:43 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779973ddcfsm116793655e9.15.2025.11.16.23.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 23:42:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 1/8] util: add prelude
Date: Mon, 17 Nov 2025 08:42:31 +0100
Message-ID: <20251117074239.190424-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251117074239.190424-1-pbonzini@redhat.com>
References: <20251117074239.190424-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gsyAXnZIniilkBwdibU_qCnYAMaxju7npbJjK53qZPE_1763365365
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs |  2 +-
 rust/hw/timer/hpet/src/device.rs |  5 +----
 rust/hw/timer/hpet/src/fw_cfg.rs |  2 +-
 rust/util/meson.build            |  1 +
 rust/util/src/lib.rs             |  5 +++++
 rust/util/src/prelude.rs         | 11 +++++++++++
 6 files changed, 20 insertions(+), 6 deletions(-)
 create mode 100644 rust/util/src/prelude.rs

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 04155dabe1a..18f40fdc58b 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -17,7 +17,7 @@
 };
 use qom::{prelude::*, ObjectImpl, Owned, ParentField, ParentInit};
 use system::{hwaddr, MemoryRegion, MemoryRegionOps, MemoryRegionOpsBuilder};
-use util::{log::Log, log_mask_ln, ResultExt};
+use util::prelude::*;
 
 use crate::registers::{self, Interrupt, RegisterOffset};
 
diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index 3564aa79c6e..6e9c004ecae 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -25,10 +25,7 @@
     bindings::{address_space_memory, address_space_stl_le, hwaddr},
     MemoryRegion, MemoryRegionOps, MemoryRegionOpsBuilder, MEMTXATTRS_UNSPECIFIED,
 };
-use util::{
-    ensure,
-    timer::{Timer, CLOCK_VIRTUAL, NANOSECONDS_PER_SECOND},
-};
+use util::prelude::*;
 
 use crate::fw_cfg::HPETFwConfig;
 
diff --git a/rust/hw/timer/hpet/src/fw_cfg.rs b/rust/hw/timer/hpet/src/fw_cfg.rs
index 777fc8ef45e..ad80acd998c 100644
--- a/rust/hw/timer/hpet/src/fw_cfg.rs
+++ b/rust/hw/timer/hpet/src/fw_cfg.rs
@@ -5,7 +5,7 @@
 use std::ptr::addr_of_mut;
 
 use common::Zeroable;
-use util::{self, ensure};
+use util::{self, prelude::*};
 
 /// Each `HPETState` represents a Event Timer Block. The v1 spec supports
 /// up to 8 blocks. QEMU only uses 1 block (in PC machine).
diff --git a/rust/util/meson.build b/rust/util/meson.build
index 8ad344dccbd..da5d0f779d1 100644
--- a/rust/util/meson.build
+++ b/rust/util/meson.build
@@ -34,6 +34,7 @@ _util_rs = static_library(
       'src/error.rs',
       'src/log.rs',
       'src/module.rs',
+      'src/prelude.rs',
       'src/timer.rs',
     ],
     {'.': _util_bindings_inc_rs}
diff --git a/rust/util/src/lib.rs b/rust/util/src/lib.rs
index d14aa14ca77..7d2de3ed811 100644
--- a/rust/util/src/lib.rs
+++ b/rust/util/src/lib.rs
@@ -4,6 +4,11 @@
 pub mod error;
 pub mod log;
 pub mod module;
+
+// preserve one-item-per-"use" syntax, it is clearer
+// for prelude-like modules
+#[rustfmt::skip]
+pub mod prelude;
 pub mod timer;
 
 pub use error::{Error, Result, ResultExt};
diff --git a/rust/util/src/prelude.rs b/rust/util/src/prelude.rs
new file mode 100644
index 00000000000..f52e7100e9f
--- /dev/null
+++ b/rust/util/src/prelude.rs
@@ -0,0 +1,11 @@
+//! Essential types and traits intended for blanket imports.
+
+pub use crate::error::ResultExt;
+pub use crate::log::Log;
+pub use crate::timer::Timer;
+pub use crate::timer::CLOCK_VIRTUAL;
+pub use crate::timer::NANOSECONDS_PER_SECOND;
+
+// Re-export commonly used macros
+pub use crate::ensure;
+pub use crate::log_mask_ln;
-- 
2.51.1


