Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EDCC83F17
	for <qemu-rust@archiver.kernel.org>; Mon, 14 Jul 2025 22:33:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ubRjl-0001bw-Je; Mon, 14 Jul 2025 18:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubRMb-0000y9-Ow
 for qemu-rust@nongnu.org; Mon, 14 Jul 2025 18:09:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubRMZ-0000JP-2m
 for qemu-rust@nongnu.org; Mon, 14 Jul 2025 18:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752530968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6uSxElZbJWChayxu0fEwTPCqzfIl4gnOrF+O5vbwmp8=;
 b=culgOi/Vtjx1xcsSBKPHHqePDsx5fPAgjdUoSSWvSbJWyz6ViKIPm+QV+j8RHlY97Hn0R/
 i6ITlTnIgydWgCIuMQOLjK2jSFztN/IHvBNxxib8snVlAuyWDbZdCmL8Id5UbYhbslt9zX
 U9UgcjYUztC/G2ClHulkMdA8el4P9DA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-P6Hxcl2JNJKyyHeF5APFQA-1; Mon, 14 Jul 2025 18:09:26 -0400
X-MC-Unique: P6Hxcl2JNJKyyHeF5APFQA-1
X-Mimecast-MFC-AGG-ID: P6Hxcl2JNJKyyHeF5APFQA_1752530966
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-455e9daab1cso6839385e9.1
 for <qemu-rust@nongnu.org>; Mon, 14 Jul 2025 15:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752530965; x=1753135765;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6uSxElZbJWChayxu0fEwTPCqzfIl4gnOrF+O5vbwmp8=;
 b=BCSogxbTQAqDedGmAkhOlaeLWPknt+yUkHKvDKeU8y8AG5dachdYn0ZVHuhsvjyqP3
 zwmkEuVGf4zu98VtkH/KO41l5P6/d+eliXNKw8PnMwsolymgOCS2zRANP30gPZ56d0ti
 oTcaRmcYZ0XThL05GiB0/j/0t502+L+ljfAJhAzoFaOAbf5qEkLZB33HEnSOkVO+NReZ
 SZFL7PS0H6n+nc3kl6LlUzH8i23+meNxzzMFePy8mQFAZ+4cNP7/Rkft2DctyeW0qNw0
 +i04i5ZZUwftvA3UezOj7NqKSoatLM+1xfbtIYgooZFWfaUrq/vO+Q2/XeJtY3a+fn3B
 6oLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG3FqDuc6aYiJILfTiBJEg3j0N/eqFWI7ggyvNTL5JqXcJ8I5GKllZHo05ESFJhia6fcWxAJ9mWKc=@nongnu.org
X-Gm-Message-State: AOJu0YwOmeMfjK/4ZUAbDNxuLrZCGrgCyQQVJS7FPxbVNWYMsmJ7jLBG
 YBQ/YRt+i4snOzS53RNSFN47BXREHpLSyHzTyhiF7aEN5uYcvvs0CW3/h6/OwylrprpJS8k2lj3
 hxx8ZihKNcAYi1YMD23qPvn/1Um0rCM6aaKSHlI2u93iOuU+999V7iYQ=
X-Gm-Gg: ASbGncvIcHV4TSufME1ngAjVP26QTbNp3w/XrULiXgTA0jfQraT2jYuSxbgiJ+Vlz6m
 WxTgaJLyrrJEbjUU/fQL/TCaMSOR5V0dkMTdQCd9NPCmsXsoOx9UuiZ2qbNNEG4Ubbx+nU8oF9P
 gdl3wpFV1a0v7SIyJ8oosPN0bbjagRjSyDBCbfQLNx7qJiZ5U23iJ4npI1Ie13KFIKkL0gwNoDU
 OkbKgN32M3Mgo5UfhnDCAGOfh/gYRfyQvAp65Lg2Aom/RYSmPUeGr4n9lmK/46rreZcXLmOQ7lt
 C4v4drvpURVMC61bmWpS3kv70M4PEJaN
X-Received: by 2002:a05:600c:1c21:b0:456:eab:633e with SMTP id
 5b1f17b1804b1-45627416ddfmr3029125e9.17.1752530965505; 
 Mon, 14 Jul 2025 15:09:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf4fUbqEuq7yOUTIGbCjHVThQbgZ5s7mi9Y2FZrPByntykGQVt8LYIvN9oBmCSjrdleYkXrw==
X-Received: by 2002:a05:600c:1c21:b0:456:eab:633e with SMTP id
 5b1f17b1804b1-45627416ddfmr3029025e9.17.1752530965065; 
 Mon, 14 Jul 2025 15:09:25 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-456111574adsm65899375e9.11.2025.07.14.15.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:09:24 -0700 (PDT)
Date: Mon, 14 Jul 2025 18:09:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org
Subject: [PATCH] rust: bindings: allow any number of params
Message-ID: <a4c65fb2b735740bda2874c86de31d29a5ae24d2.1752530758.git.mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sqKbCIGxy5YTZpdTMlcOUmgiwmI5UmRqEj6qFLU7RN0_1752530966
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


