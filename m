Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC73D111A8
	for <qemu-rust@archiver.kernel.org>; Thu, 27 Nov 2025 13:21:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vObwG-0007NT-AA; Thu, 27 Nov 2025 08:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vObvT-0005MQ-E8
 for qemu-rust@nongnu.org; Thu, 27 Nov 2025 08:20:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vObvQ-00023l-9D
 for qemu-rust@nongnu.org; Thu, 27 Nov 2025 08:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764249642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LYg5lNnE8rdhG0r9RcJgUpFFZd7vvBdLGPpZf4aLMBU=;
 b=VnqOmORhFsCIm9sloETcUC7kcxdv7VvhPNvmpFsH/+5iTM0KRt3cWG86MmKfFmehbiIETd
 q7vkx/PfGwBqCsR1/JcBk3aK1CUES5atBJ3visQhkM/d+T7/1alYDMod+1eVBBSUnjrH2B
 9U7DpKA7yrHyehymq6J4qtp9fJby8ts=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-Hx7GK6pNPZyJcxMPRGuNwg-1; Thu, 27 Nov 2025 08:20:41 -0500
X-MC-Unique: Hx7GK6pNPZyJcxMPRGuNwg-1
X-Mimecast-MFC-AGG-ID: Hx7GK6pNPZyJcxMPRGuNwg_1764249640
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b735efd650fso98393366b.0
 for <qemu-rust@nongnu.org>; Thu, 27 Nov 2025 05:20:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764249640; x=1764854440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LYg5lNnE8rdhG0r9RcJgUpFFZd7vvBdLGPpZf4aLMBU=;
 b=F65HrP+g8tS4cWdEq/eM20ejFgPPSGfoxYvIz7v6eWdeKWzNdVTNH5GErrXIAw7j3D
 L50J6DE8rm1uI40CuMNVFekulcwJg92SGO3E4wY6/ESXaC8sIrhHXRKyvkAxz+Nd3JMt
 h1CPT0ZgpLQEc6WaVnNmSMBN5yXLPNDYGwGJtCqLQMmKTRO8V4w2woF8MOtMcEmB5laA
 LXlYbzGD95dqouUeHYqneooNEfr8qhh9Dtcp5ZOjmh1jmkRMmLqzPoBwR8UretNAluwo
 pVxwtcCr1xwNNA67xiU4XO1f3DkUQbL1i2DiraUijbVbN9M4aP0/i7iLK/pB01aRMz/U
 vJnw==
X-Gm-Message-State: AOJu0YxuTv43zF7gDdVta69PqedEvPRVEULgfpqDLh8gZHM2hM9j94qi
 J6B4w11l1DOGtlI2OwCS4Vr+7BkOauuP0D+w+T2GIdJwGkrMyDEsmg5zC9HA5iC6VfZzO5LmA+C
 9qIO3Z88AAUkl565qXMLOHxKINniKOsSaZ1pkHSKQ5b8qtgL4WgKdAG4=
X-Gm-Gg: ASbGnct0nRnuSmYHk9Qwo5IEYStnwkEExf7iRFJRJbbFZH7bFUvf3aBJQJgjYG7a99f
 dGts/dHSciQc3wrMc0sP0pMNpHRh00BZ25lHzHTbamPznOhL0eNjL0foSCSDHi0tp+MEH/2FZ6v
 nPv/Ae1ranbyDysKXrMifOLFS6IyJonTH/2DTGjDN30v5Bx8b8ywJ2a6KBqEXtFoIEBMlyplSyc
 BYAC1LWZ7H9v+6UeN0hz4odiu8Kb/DBoC54QS/r8rDP6OHd3kTQc/GO+q7nZ2OuRKB1ao/7s4Iu
 yn1xZAUgLuiN2cJ+1UzZ+kbD8MUqTr/2BoRAYntwnTukDUBc1TsCQKQftY4Ji/Ck6JNT5lORQIz
 UoR7PyPslFuTQyjsHoHQj88Sw/6jFM7B7L/mUfoG4yEpE4g373Xjifk1xHRMLhNkvLhVmT+Q5O2
 x7ga3nKdrxFaOiPKY=
X-Received: by 2002:a17:907:3f9c:b0:b73:7f1c:b8d8 with SMTP id
 a640c23a62f3a-b767129709dmr2419810266b.0.1764249639939; 
 Thu, 27 Nov 2025 05:20:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdU8wOIJQbd2oYcYyBfq7uZVilQhWmJGvPR4ghgRuCUqWn8gCp1QyRanWVKr5t1pCEGhNRVA==
X-Received: by 2002:a17:907:3f9c:b0:b73:7f1c:b8d8 with SMTP id
 a640c23a62f3a-b767129709dmr2419806566b.0.1764249639532; 
 Thu, 27 Nov 2025 05:20:39 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f5a48c7bsm160575166b.64.2025.11.27.05.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 05:20:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 1/9] rust: remove leftover bindings/
Date: Thu, 27 Nov 2025 14:20:28 +0100
Message-ID: <20251127132036.84384-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251127132036.84384-1-pbonzini@redhat.com>
References: <20251127132036.84384-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NuGysB0FDz3CFECcfcE5Hwi_yMbbrE-9OPbSbY5Yzak_1764249640
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.224,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 rust/bindings/src/lib.rs | 64 ----------------------------------------
 1 file changed, 64 deletions(-)
 delete mode 100644 rust/bindings/src/lib.rs

diff --git a/rust/bindings/src/lib.rs b/rust/bindings/src/lib.rs
deleted file mode 100644
index 4c9bb794f79..00000000000
--- a/rust/bindings/src/lib.rs
+++ /dev/null
@@ -1,64 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-#![allow(
-    dead_code,
-    improper_ctypes_definitions,
-    improper_ctypes,
-    non_camel_case_types,
-    non_snake_case,
-    non_upper_case_globals,
-    unsafe_op_in_unsafe_fn,
-    clippy::pedantic,
-    clippy::restriction,
-    clippy::style,
-    clippy::missing_const_for_fn,
-    clippy::ptr_offset_with_cast,
-    clippy::useless_transmute,
-    clippy::missing_safety_doc
-)]
-
-//! `bindgen`-generated declarations.
-
-#[cfg(MESON)]
-include!("bindings.inc.rs");
-
-#[cfg(not(MESON))]
-include!(concat!(env!("OUT_DIR"), "/bindings.inc.rs"));
-
-// SAFETY: these are implemented in C; the bindings need to assert that the
-// BQL is taken, either directly or via `BqlCell` and `BqlRefCell`.
-// When bindings for character devices are introduced, this can be
-// moved to the Opaque<> wrapper in src/chardev.rs.
-unsafe impl Send for CharFrontend {}
-unsafe impl Sync for CharFrontend {}
-
-// SAFETY: this is a pure data struct
-unsafe impl Send for CoalescedMemoryRange {}
-unsafe impl Sync for CoalescedMemoryRange {}
-
-// SAFETY: these are constants and vtables; the Send and Sync requirements
-// are deferred to the unsafe callbacks that they contain
-unsafe impl Send for MemoryRegionOps {}
-unsafe impl Sync for MemoryRegionOps {}
-
-unsafe impl Send for Property {}
-unsafe impl Sync for Property {}
-
-unsafe impl Send for TypeInfo {}
-unsafe impl Sync for TypeInfo {}
-
-unsafe impl Send for VMStateDescription {}
-unsafe impl Sync for VMStateDescription {}
-
-unsafe impl Send for VMStateField {}
-unsafe impl Sync for VMStateField {}
-
-unsafe impl Send for VMStateInfo {}
-unsafe impl Sync for VMStateInfo {}
-
-// bindgen does not derive Default here
-#[allow(clippy::derivable_impls)]
-impl Default for VMStateFlags {
-    fn default() -> Self {
-        Self(0)
-    }
-}
-- 
2.51.1


