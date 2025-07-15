Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416A6C83F1D
	for <qemu-rust@archiver.kernel.org>; Tue, 15 Jul 2025 06:57:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ubZbh-0000f2-Ao; Tue, 15 Jul 2025 02:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubZaL-00005i-Gv
 for qemu-rust@nongnu.org; Tue, 15 Jul 2025 02:56:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubZaI-0002V8-TD
 for qemu-rust@nongnu.org; Tue, 15 Jul 2025 02:56:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752562572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7yNuDNUb8sgDdCltxRTw4gin9fX6EQkmxTEt1nRxR+Y=;
 b=Dn0kQyb0wPVey74kd8zHH41tCU/ufDR2/kixfhtUpwRLz/EZd55vIZWpEMPqTQJlKD4JSa
 WEZWnjwFL6ejeri2c6hIj/1QEoTejluSCQxlcEe1XfHgFh/22zLcH1saD/E1/qoB7g/ps5
 lwsIlUWgtBNaW87yAkiV6KMxGnkLMj4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-3Mc6Z9jfPui_t6E7-3peNw-1; Tue, 15 Jul 2025 02:56:11 -0400
X-MC-Unique: 3Mc6Z9jfPui_t6E7-3peNw-1
X-Mimecast-MFC-AGG-ID: 3Mc6Z9jfPui_t6E7-3peNw_1752562570
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4e713e05bso2152566f8f.3
 for <qemu-rust@nongnu.org>; Mon, 14 Jul 2025 23:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752562570; x=1753167370;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7yNuDNUb8sgDdCltxRTw4gin9fX6EQkmxTEt1nRxR+Y=;
 b=DsSWjf/6B+qAIxBUQlB1rFKDAT2ksAnOeowR/zezV1ayKzS+czJykR+e3f+/MO92Ow
 FvUHVVLQaH9lin63FzgzmoUany1ukwSLmYudswsBgk21DlIAQfHFstJz5nWiwwGag8Oj
 Z1M1+Uq6WFj4xzsZnjHrYiwsSln2aOO+m2fcaucw5ExrTuZ1PGqgxpZTlSmbt6MTJj3E
 EaPWJ9vJyG91p3S9hkgScOR4qyEjZeBJ8rZAVnguQ6xbo1L7AxGZqRrNSvcqWQZRaa4t
 0CCj84iJ27Hclu4hUDeZKzj2TA7DTQ5HBrp0f5zThpzlKOgO7NsAWx3ycepycMh0JwPT
 rfOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC9zU/5uDd0grsT7QPra36TJyb30c6vxXDjaoBfxa5xzVyQaG8+gd7BRMZH6O0p8kfQnQXc0hsZbI=@nongnu.org
X-Gm-Message-State: AOJu0Yyoz7PdfDPRO1w69XZXfPfnh/iy6eGuiJwCvSryVztPvAMaWhKx
 tvHSVDrj0lbCbwHmHyUVMBN5wKHXCNfvVUrnzfpCE93tx9DhJC+UvS+20ktKMbd2r8jliTg4FeM
 2F5P9F2HqgGV5NkwrStaFzS/XwfQzcD1LqiHByXwZAIhQZ6J4QvDV5fs=
X-Gm-Gg: ASbGncvSJkR5aZqvCcHcVlTxVfZoBXB1eJHaB9mI5OFdhfO9aMxtpO3AES+j4UD+B9U
 PHMcu2q7fT86VvvJHV3ebH0hGqsQezxn0Ycej1TnwI/6WJ8Kxp9HG8sRHbeXUorzitOXAgck4Ep
 zBGVepBiixikFFbG5MVZQmg7L3jWvzkzgJO6ZYJbDSe2H1rpU2CaW8O/wCvqNmNJfJvv+mwlBGz
 010Hw/7TIGIkMeYNwt2QHBf2pRcUwLW1GTJYfIwLr6uzXCDr5niTNKI/8J4uUTTQJPXdMTFKdjL
 e37V4iIWNsp9uSre2UbEjqv6p/Kudh5E
X-Received: by 2002:a05:6000:1882:b0:3a3:7387:3078 with SMTP id
 ffacd0b85a97d-3b5f2db1241mr12134702f8f.4.1752562570153; 
 Mon, 14 Jul 2025 23:56:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcz4f47+TFKf95QeECfPiWVpN6YlsiQRUKmw/NqwqBmCEDKUvsADoI4jOr+ASD6mfHDNDYxQ==
X-Received: by 2002:a05:6000:1882:b0:3a3:7387:3078 with SMTP id
 ffacd0b85a97d-3b5f2db1241mr12134686f8f.4.1752562569798; 
 Mon, 14 Jul 2025 23:56:09 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d5easm14162312f8f.48.2025.07.14.23.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 23:56:09 -0700 (PDT)
Date: Tue, 15 Jul 2025 02:56:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?us-ascii?B?PT9VVEYtOD9xP1BoaWxpcHBlPTIwTWF0aGlldS1EYXVkPUMzPUE5Pz0=?=
 <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org
Subject: [PULL v2 28/97] rust: bindings: allow any number of params
Message-ID: <d60816f7f317e52bf382a5cc0bc29b41f5864929.1752562442.git.mst@redhat.com>
References: <cover.1752534227.git.mst@redhat.com>
 <04130b3dc5af620213a90d300933517b39f43bba.1752534227.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <04130b3dc5af620213a90d300933517b39f43bba.1752534227.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: riuLEG7cSjGeH5qbgSQLcC_cduzfCpSX0T4FO_V3Uys_1752562570
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <e41344bd22248b0883752ef7a7c459090a3d9cfc.1752560127.git.mst@redhat.com>
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


