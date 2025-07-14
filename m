Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84625C83F1A
	for <qemu-rust@archiver.kernel.org>; Mon, 14 Jul 2025 23:09:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ubSHW-0006P0-Ud; Mon, 14 Jul 2025 19:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubSGh-00040q-Un
 for qemu-rust@nongnu.org; Mon, 14 Jul 2025 19:07:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubSGf-0005XB-Ve
 for qemu-rust@nongnu.org; Mon, 14 Jul 2025 19:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752534449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9bYQ5u6pgRJHAntarcEw+lqU/yhh0ZBAg0JEBQxhXo=;
 b=ax55UOrvu0gao6V0kztua9lA3AgE2zQ5IxTK2ICr3Zgn8OsbVj/XVjY2VWXDMy0oJQH/yH
 9XjfECJ2YfjorgH3kkU51YB1v/HNuQjlJXyqUyp5FRVlDZ9XVdKpMzs9ApfaDre5XSwnd6
 Y5k+UI2LNpx8VLvgXvajpsCIYgYuozA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-EVufMKbfM8GD2I_1LalWeg-1; Mon, 14 Jul 2025 19:07:27 -0400
X-MC-Unique: EVufMKbfM8GD2I_1LalWeg-1
X-Mimecast-MFC-AGG-ID: EVufMKbfM8GD2I_1LalWeg_1752534447
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45626532e27so1766475e9.1
 for <qemu-rust@nongnu.org>; Mon, 14 Jul 2025 16:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752534447; x=1753139247;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m9bYQ5u6pgRJHAntarcEw+lqU/yhh0ZBAg0JEBQxhXo=;
 b=b52qx17/w6JbMCey+e1Cbw+YlEDnMOka6pn3YTOr9jF9Dv7LELElWWqaiGPtgZwkVG
 THrArYr5ZbZYSFPfcUQcEIKu8JBCuzJ54nTgkconWhZIJJcfVUulHbvS0isJYSIDm4UF
 Ao0S8TA6bWauD7DU9sJMWhf6z4VBhs4BQvBBIjkazO5QEq79EOAFAGQhKiSavQBidcUl
 zXYRcfoUf7cLDVdJRhJ+Yr9SThMw586taRt1BJJT8b4GfXUt8oo2drM5qcnEnHTVNrZg
 LYR2PKO6XVxZ5qbWIYqCR2g4/U4CttzH1u1VrWCMrSUttcttHrlLmyCRu1a6zDr6GnNc
 Z1+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLGsLp5YndMEfmnT9AIdvhQe895/o/L5/Fx7d85xu/w1+5+YpY325aX4a0itB9hPON+pawf2684oA=@nongnu.org
X-Gm-Message-State: AOJu0Yx3D40YCMLnsS7I518W/QYVf9GYqOuQcuPnudqoeOWHXOYoqe0a
 b8n5zLcG/spk97H588su/M552JMqMLTwQu5yvwJeULIML7ItLs9AmsQllYqosYS0W6oNjhFp93f
 lrcnd1uezTzVPl2iiRbF9Zg9GgC5QLNF2v4haF64L8h8VPeqxi0pzaOE=
X-Gm-Gg: ASbGncutKpqjy6Zl247Z31XhTy/SGQGJFszlKwdcfIFTB43WQdXfLyzg6RTMGX24WUu
 VDU/uogO6xTB95Ij/+Rv+tSdFfNjtZq4wRlUF5QKUrPR5sUkLPS8tRVlUC+WDrUrncalvVpTeQR
 VIc4o3wRabjXRNOMfs1QtpTW+6snBIEuD+sFM3WZ1cdFnHhUaqaqFM+/pjl2DyiMFMfZsUEGbTB
 iR97GWkBlNNW2FtRScJ2hi3tiQzRoUHAVus4AAMuoeBFb1SBJrB5bPq1RthbVJ9pmuwk1PF8Iuj
 PV2X2OldUZ7WqTVrZ7Um+OKmo7wnRTFp
X-Received: by 2002:a05:600c:46c5:b0:442:f4a3:b5f2 with SMTP id
 5b1f17b1804b1-4555f895bb0mr129278505e9.6.1752534446614; 
 Mon, 14 Jul 2025 16:07:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEl/PhahyPwKcaZ9Lf3VUbFnCA7UevHuv+u45o4ZgPQ45GdGCRRRpU0cp498vZ+Au0xGwD20A==
X-Received: by 2002:a05:600c:46c5:b0:442:f4a3:b5f2 with SMTP id
 5b1f17b1804b1-4555f895bb0mr129278355e9.6.1752534446185; 
 Mon, 14 Jul 2025 16:07:26 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-455f222e4f4sm104491225e9.10.2025.07.14.16.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 16:07:25 -0700 (PDT)
Date: Mon, 14 Jul 2025 19:07:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org
Subject: [PULL 28/97] rust: bindings: allow any number of params
Message-ID: <04130b3dc5af620213a90d300933517b39f43bba.1752534227.git.mst@redhat.com>
References: <cover.1752534227.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1752534227.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cOZ4IqskEEtr0OsFaZ_vBfHpARdhg1tpbgla-0145-w_1752534447
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

We are going to be adding more parameters, and this makes
rust unhappy:
    Functions with lots of parameters are considered bad style and reduce
    readability (“what does the 5th parameter mean?”). Consider grouping
    some parameters into a new type.

Specifically:

error: this function has too many arguments (8/7)
    --> /builds/mstredhat/qemu/build/rust/qemu-api/rust-qemu-api-tests.p/structured/bindings.inc.rs:3840:5
     |
3840 | /     pub fn new_bitfield_1(
3841 | |         secure: std::os::raw::c_uint,
3842 | |         space: std::os::raw::c_uint,
3843 | |         user: std::os::raw::c_uint,
...    |
3848 | |         address_type: std::os::raw::c_uint,
3849 | |     ) -> __BindgenBitfieldUnit<[u8; 4usize]> {
     | |____________________________________________^
     |
     = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#too_many_arguments
     = note: `-D clippy::too-many-arguments` implied by `-D warnings`
     = help: to override `-D warnings` add `#[allow(clippy::too_many_arguments)]`

I didn't want to disable this globally, so I just shut it off for this
file.

Message-Id: <a4c65fb2b735740bda2874c86de31d29a5ae24d2.1752530758.git.mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 rust/qemu-api/src/bindings.rs | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/rust/qemu-api/src/bindings.rs b/rust/qemu-api/src/bindings.rs
index 057de4b646..b4692f9b4b 100644
--- a/rust/qemu-api/src/bindings.rs
+++ b/rust/qemu-api/src/bindings.rs
@@ -18,11 +18,15 @@
 
 //! `bindgen`-generated declarations.
 
-#[cfg(MESON)]
-include!("bindings.inc.rs");
+#[allow(clippy::too_many_arguments)]
+mod gen {
+    #[cfg(MESON)]
+    include!("bindings.inc.rs");
 
-#[cfg(not(MESON))]
-include!(concat!(env!("OUT_DIR"), "/bindings.inc.rs"));
+    #[cfg(not(MESON))]
+    include!(concat!(env!("OUT_DIR"), "/bindings.inc.rs"));
+}
+pub use gen::*;
 
 // SAFETY: these are implemented in C; the bindings need to assert that the
 // BQL is taken, either directly or via `BqlCell` and `BqlRefCell`.
-- 
MST


