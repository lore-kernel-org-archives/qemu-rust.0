Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BB6CEACEF
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Nov 2025 07:44:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vKttm-0003aq-10; Mon, 17 Nov 2025 02:43:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKtt7-0003SW-24
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 02:43:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKtt3-0005w7-Uc
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 02:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763365375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQzjTFfWRdSW8gNz8omUuliKS/DL3l6Q/I07/brxsKY=;
 b=gAUEnRA3BLv3H7U7EFrdNEVlQO2kjU7Ohs7qB8FvDelMmzJzNFAPossj221o57CO00KAux
 6uSlQoqQ7Bj9eDcEsTSiBwdw5rZYFqfC9rZTcYAxKE01d/Be2YlxF/QVqu6LBWwy2eo3uG
 1Xsvv0LNsXtiaGaVDg3rQGC96DYVve4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-DLiO1h-fMSeZr_llpp6KjQ-1; Mon, 17 Nov 2025 02:42:54 -0500
X-MC-Unique: DLiO1h-fMSeZr_llpp6KjQ-1
X-Mimecast-MFC-AGG-ID: DLiO1h-fMSeZr_llpp6KjQ_1763365373
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-42b2f79759bso2743364f8f.2
 for <qemu-rust@nongnu.org>; Sun, 16 Nov 2025 23:42:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763365373; x=1763970173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uQzjTFfWRdSW8gNz8omUuliKS/DL3l6Q/I07/brxsKY=;
 b=DqQxyuB32uDTR17t1lnZO9Sb93HMrzTn4lQK1ku1parwc/ymaEIWkR4Tsb8RpoIvwy
 05M31HI3YUr5tAyjHD51FwRY86QJkJoCoUsMtYjVywoAtvUUdx7ec/6gUMzISotxnKHO
 XpeC10Ly88Mz2dAUgET3Mbp8W9VSGhHc32CvAc32hsCvoqunQzcXpJ1+gRGBxaI6bpXe
 Sfp8fLl4rVWSEFPRGm5+OXwOK+efPiV+S0iWkIVVXYneECcHkMpGMZz8Kd/DLfoM2AZz
 IU1ZQk7xckFmWPC2XPRKpb5srNPMTMiEXgWLJNSZ/bN+Ue0hU1xGWgm9tkD4aqRekakP
 26Og==
X-Gm-Message-State: AOJu0YzrOrqT2jCnyT8pjtEU1HRcinGa5lANeu6mWJloqVk15FtmFbhk
 LjxnGF/ELHWUVh/fByKySgymN6dpbzvvGgSBAKoCjW+FgTQdL3RtUWyUktJrFM1G9UpTm/V3Inl
 E2sSqGaSXZcWzTGaQgBPiDxM4vM993jcx1nO2AGhNwjnV8GYuyH2sfrUKCJdMnUE=
X-Gm-Gg: ASbGncvLSVY82RC2LF/1Z6DVyIrqk19tuAFygdPOobDTpn427wAqGPJFZJgYYEonWE8
 3cTYXCr3gCa7TZj8xcC75eVUTcfK32lEIcpJpdU0w2uud3EiYSri3ip0oy0r7FeMA9n+LOhLMah
 YKSfNo9EfwrA+cEDzw0CfO6xBzBzxkihEQOnDXBX+SeeahN/e30+BPaQSVWFHAuQ9EM4WefFfbQ
 UnIvYwvLs9KIezEaIuF+Es9YM2LiFXoBRGgUyDrteFK7e9Pp8BHXk8A3pwN2xBicKQ1jMq7+90g
 eyEiNfaiHqrXlGd89x+dzVCRiDeGpCYKkYj23R93n0RpeGgTimMyP66srHQc7f5hu47pTMc1e9d
 aDW9noJ8Z1/AOU2RK8Wnbh3di/l5ENzQCz3o5WoeBaEs+Oy7TJPUviWgXC/VQKkcfyrpyHkCrr7
 oJJfGT
X-Received: by 2002:a05:6000:26c3:b0:42b:5448:7ae8 with SMTP id
 ffacd0b85a97d-42b59372315mr10909485f8f.29.1763365372713; 
 Sun, 16 Nov 2025 23:42:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnIN/NNJVK3bNuBHUK3xJ4h2qsSBtlJJIi+oqggakdn0dlueBMskOY27cwQbEtC5ckGivvQw==
X-Received: by 2002:a05:6000:26c3:b0:42b:5448:7ae8 with SMTP id
 ffacd0b85a97d-42b59372315mr10909469f8f.29.1763365372346; 
 Sun, 16 Nov 2025 23:42:52 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e85e6fsm25033505f8f.18.2025.11.16.23.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 23:42:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 5/8] chardev: add prelude
Date: Mon, 17 Nov 2025 08:42:35 +0100
Message-ID: <20251117074239.190424-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251117074239.190424-1-pbonzini@redhat.com>
References: <20251117074239.190424-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zey-0egTrm8yByt83nrFKfJqVc-VDJxRH5loqaavNT4_1763365373
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/chardev/meson.build         | 1 +
 rust/chardev/src/lib.rs          | 5 +++++
 rust/chardev/src/prelude.rs      | 4 +++-
 rust/hw/char/pl011/src/device.rs | 2 +-
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/rust/chardev/meson.build b/rust/chardev/meson.build
index 36ada7c4546..d89baba8e20 100644
--- a/rust/chardev/meson.build
+++ b/rust/chardev/meson.build
@@ -30,6 +30,7 @@ _chardev_rs = static_library(
       'src/lib.rs',
       'src/bindings.rs',
       'src/chardev.rs',
+      'src/prelude.rs',
     ],
     {'.': _chardev_bindings_inc_rs}
   ),
diff --git a/rust/chardev/src/lib.rs b/rust/chardev/src/lib.rs
index 2e549f99d91..93a28725932 100644
--- a/rust/chardev/src/lib.rs
+++ b/rust/chardev/src/lib.rs
@@ -4,3 +4,8 @@
 
 mod chardev;
 pub use chardev::*;
+
+// preserve one-item-per-"use" syntax, it is clearer
+// for prelude-like modules
+#[rustfmt::skip]
+pub mod prelude;
diff --git a/rust/chardev/src/prelude.rs b/rust/chardev/src/prelude.rs
index 9f0b561bfab..f949d925399 100644
--- a/rust/chardev/src/prelude.rs
+++ b/rust/chardev/src/prelude.rs
@@ -1,3 +1,5 @@
 //! Essential types and traits intended for blanket imports.
 
-pub use crate::chardev::{Chardev, CharFrontend, Event};
\ No newline at end of file
+pub use crate::chardev::Chardev;
+pub use crate::chardev::CharFrontend;
+pub use crate::chardev::Event;
diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 2e4ccc9b231..ff929e60993 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -5,7 +5,7 @@
 use std::{ffi::CStr, mem::size_of};
 
 use bql::BqlRefCell;
-use chardev::{CharFrontend, Chardev, Event};
+use chardev::prelude::*;
 use common::prelude::*;
 use hwcore::{prelude::*, ClockEvent, IRQState};
 use migration::{self, prelude::*};
-- 
2.51.1


