Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65570C83F1D
	for <qemu-rust@archiver.kernel.org>; Tue, 15 Jul 2025 06:19:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ubZ0u-000285-4g; Tue, 15 Jul 2025 02:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubYxH-0007th-BY
 for qemu-rust@nongnu.org; Tue, 15 Jul 2025 02:16:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubYxE-0006Py-MP
 for qemu-rust@nongnu.org; Tue, 15 Jul 2025 02:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752560151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uh429H/7Fd0JqSjaTv4ix/gvZDdMnAIxIzaDOJCmbvQ=;
 b=Rnp2Yg4jTUSv+Rj7g4f2YxkukpGv2kkLzR/IFCEcmDT0DKQgViMibyctVlYrGalZja+Bn1
 QHyND6brjOPS7BQM2qTmK0zRsOHJEooYY+9pvkWK8lnuaJt/N8Css1eLQbLjgPl961Bdpt
 0bzySqHkYJES7KO/RNg6EB1uIgQ+ZLQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-TCz7F9IROzmYr85Rxgoy3w-1; Tue, 15 Jul 2025 02:15:50 -0400
X-MC-Unique: TCz7F9IROzmYr85Rxgoy3w-1
X-Mimecast-MFC-AGG-ID: TCz7F9IROzmYr85Rxgoy3w_1752560149
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4f6ba526eso2673892f8f.1
 for <qemu-rust@nongnu.org>; Mon, 14 Jul 2025 23:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752560149; x=1753164949;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uh429H/7Fd0JqSjaTv4ix/gvZDdMnAIxIzaDOJCmbvQ=;
 b=jpSIaXuKbSkHLrubMPcJQivv0xTPnNlbsHRAx5spZCj1BZb1gNjlzHvNLQLmckO7pz
 inz3Pf5Q6r01c/VpguKgBqvbqQWYA2yqL0XK2k9Ewv+meFnfm4TszQ96mi+UXXue62q7
 xH6CKquXOO5NCVLgmwTTnL6Jx0nKV0MGK1wiqB2GBnlvdU85DWaQhaM0I73C++S1wwdq
 W3UE5J02naSt2BNRiFR5xV3PLkOgHO5IWD6otBZkJviIhpf4Cdpx1tRRkM0KveNlmlkZ
 TZKT+nVoP2D6QYNvqWN6uWBvop1cMsJ6AHAUbji5bxkEsP5zlw3EA97l9rM02Y8pbCU3
 yUaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXZ6I/CHBWhhGSUcubO+ZJ/65Z0l1cIJ5g1qnkM77OIU0fsGcg880olOIGgd1bU+t6/2HVFWaUPZY=@nongnu.org
X-Gm-Message-State: AOJu0YxkLF2hoOJZStmJm51MYMB+uEKxFvXTvqOceGYjoxXDJHZlrDjq
 /ERiWIFFRsjM/ugofZ0zGa//xFlTBzLtmfp3S4IYUqoHQ9CntnR7VxN3qOma1a6SelroRIXgpVJ
 1MfwJB2gfZkONTUG7c4bpBASIJXsrZpAdpMmQnmMholcHF/d4Qf03frrdDCRX17Q=
X-Gm-Gg: ASbGncvBITd961262RhCNQ1CF4i0XSbitKNFGeHAkm1fSypbE1NBdhYFxzxLP3L6a/f
 wwj1jwcoBN5N2mDzFL3tYwIW+3N09C+AgKah1Bsvakx2hMKnNfxX/tTWcf2OkjRc+RF1BEaIMTR
 8vd5wtu7NMvxK0yAW//MvRqdoNH31fV+69Xx6Vpg5NvfyoCvLBwxwGsJgGBnyuFos4sFdUsJCI0
 40LU1E9NjpW6W1IT2zJ1E9KexxapGbvQIJTHnSdUmvzrHtifV86UKfFf/Gj3jnR6epx2L8ATQhv
 w2e6XE5tb4+DPQ01EhzH/N8OyMYJ0vbU
X-Received: by 2002:a05:6000:43d5:b0:3a5:2ec5:35a3 with SMTP id
 ffacd0b85a97d-3b5f18e82d8mr9966099f8f.45.1752560148980; 
 Mon, 14 Jul 2025 23:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT7GVM6dTzSOuN6/p9UJaJmmDrydVcqite4GPEEar6R+66sVnawTLQMMxaVABg+N3sQ/W1vA==
X-Received: by 2002:a05:6000:43d5:b0:3a5:2ec5:35a3 with SMTP id
 ffacd0b85a97d-3b5f18e82d8mr9966084f8f.45.1752560148565; 
 Mon, 14 Jul 2025 23:15:48 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e269a0sm14045211f8f.86.2025.07.14.23.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 23:15:48 -0700 (PDT)
Date: Tue, 15 Jul 2025 02:15:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org
Subject: [PATCH v2] rust: bindings: allow any number of params
Message-ID: <e41344bd22248b0883752ef7a7c459090a3d9cfc.1752560127.git.mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i5ijrP-naxl8itXG4ZrTY64EzdgDsncClYQ47qTvAL4_1752560149
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 rust/qemu-api/src/bindings.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/qemu-api/src/bindings.rs b/rust/qemu-api/src/bindings.rs
index 057de4b646..c4f1f755ce 100644
--- a/rust/qemu-api/src/bindings.rs
+++ b/rust/qemu-api/src/bindings.rs
@@ -13,7 +13,8 @@
     clippy::missing_const_for_fn,
     clippy::ptr_offset_with_cast,
     clippy::useless_transmute,
-    clippy::missing_safety_doc
+    clippy::missing_safety_doc,
+    clippy::too_many_arguments
 )]
 
 //! `bindgen`-generated declarations.
-- 
MST


