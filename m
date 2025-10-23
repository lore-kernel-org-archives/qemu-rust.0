Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE74CCD1BE
	for <qemu-rust@archiver.kernel.org>; Thu, 23 Oct 2025 13:56:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vBvna-0004kD-LY; Thu, 23 Oct 2025 09:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1vBvnU-0004bv-Co
 for qemu-rust@nongnu.org; Thu, 23 Oct 2025 09:56:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1vBvnQ-0005EH-Ps
 for qemu-rust@nongnu.org; Thu, 23 Oct 2025 09:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761227762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tC8PZlPiQjZNcHg5jwXV2rm1RllOkzq/OVQijD7JM1A=;
 b=ABEYG+6Tfv1na+HbPpztF9ihFhqU4DJMHuSYLP9rsIOoLYERXY1kVuSrfJ/5kmavJQ8VfA
 9D1OTvSS8qa1Y2x/1WYJW71hKKjE67/6dV5j+kGkyedjSZOF9xzU5fdPWtpE38e+uFMTvp
 88+NfkrxlWAOX0IgqrWTmJ7pJMjANjM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-tVufBkyyNcG2dI5YSPaozA-1; Thu, 23 Oct 2025 09:54:22 -0400
X-MC-Unique: tVufBkyyNcG2dI5YSPaozA-1
X-Mimecast-MFC-AGG-ID: tVufBkyyNcG2dI5YSPaozA_1761227660
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47106a388cfso7443685e9.0
 for <qemu-rust@nongnu.org>; Thu, 23 Oct 2025 06:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761227660; x=1761832460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tC8PZlPiQjZNcHg5jwXV2rm1RllOkzq/OVQijD7JM1A=;
 b=fXcNuOTuKhUmMWXPO12QzR9p0COlVRMisVvpORH/R++P5hsc9Wv9RfhLS76GXoiM1J
 8YcAXx/ktS8eLMjCgLXmfx0mXfYTVFCDW9oKgMyctKl9OKstnp/IFLKrzquiWbIlwh1U
 +0PPtv4nwi7SsENivD/ZOP4zZ93uHBQJoco7PpiqWrolEZrKtzti9o5Zs8TgkaR5f4D/
 ov8s2fKovCf3ZS68Ax3A2ReZXMRkeMN0Ks6EJyX6Ew11e9pO4vVqNJJz+qLU5HA4rd4E
 BLlwgExGpJpjvkXsfqc5dN7wblDrpb4ntQEuMTDgsNaTTD0tumeIxPiM2hXj5Qob2Xch
 ZB3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXbB81cIsbkPP2Z7yZv4LqQVrB09i7Bxwvnifwm/E/Uqppuppx3Fxc5dovz3bdMh4DIgrrMRb9DcU=@nongnu.org
X-Gm-Message-State: AOJu0YxGzHVyHS7qdqPpksZ7EhoYCjXFZJ9R6wecSu5w4r7a2vwswALn
 /pf622tEsGyoN5T26AUKODbyxb1HkAw4rcs5JcT/hHI3uPHJveL7AfI1AVRMZ/7ub2J0xtojo6q
 WL/3em+42DcmyDHCvpEI/RtgMnauimwS3oy+eihG+1zs/Igo4xqsI2ho=
X-Gm-Gg: ASbGncsSUY7qsgNVT3HTJDXHFJLVyuBfNwp/b5ic47/3GRsR109UhUz6IAEKqq9g9Ka
 0YhuDKvzkjdoYJLcsgNxOqYmivr4e9TYP5vPVR3D4w58Sd3ueh9ATMhG1XsrKG6aZE+4yOnI/QP
 mr6ho95BZ0KS/3To0E/yTg7bV4m0RJy33TrUjTL7l0H/MHlJHXNQbESqd8cv7rvA7HHocQ0PmWw
 krH6MWCvz5V9K2nw3XkvLKfpJEeMI6Qztxl0tvuAg54d60FSLv4cHwLTUKmckEeqpzDjI62vF2O
 tdycCd+56FdS73RQJ5LOZawTtYwqjCi1DIaewexmPB+v/2c8ArW6pnggyOxdPT4hAJv6C0u6hOS
 YLJSD/ys5
X-Received: by 2002:a05:600c:548c:b0:471:14af:c725 with SMTP id
 5b1f17b1804b1-4711787697bmr184429995e9.3.1761227660109; 
 Thu, 23 Oct 2025 06:54:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkRo97rOZa0vHoBd+1HXJAJdMK9Xy13Ii2gJArN1Q5CgZ+Gu+uE3BLWBbO8Dq8nYtz2jsSqw==
X-Received: by 2002:a05:600c:548c:b0:471:14af:c725 with SMTP id
 5b1f17b1804b1-4711787697bmr184429835e9.3.1761227659752; 
 Thu, 23 Oct 2025 06:54:19 -0700 (PDT)
Received: from wheatley.localdomain ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475cae9f571sm40672855e9.7.2025.10.23.06.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 06:54:19 -0700 (PDT)
Received: from wheatley.pinto-pinecone.ts.net (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 76740DC7C868;
 Thu, 23 Oct 2025 15:54:18 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: 'Manos Pitsidianakis ' <manos.pitsidianakis@linaro.org>,
 qemu-rust@nongnu.org, qemu-devel@nongnu.org
Subject: [RFC PATCH 2/2] rust/util: Change Timer and TimerListGroup to normal
 structs
Date: Thu, 23 Oct 2025 15:54:09 +0200
Message-ID: <b21bfbd144b1a4ecbe4b9e0323a0f57c35c6e47d.1761226974.git.mkletzan@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1761226974.git.mkletzan@redhat.com>
References: <cover.1761226974.git.mkletzan@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ro6c-QScyuaitiDKAPivZwzBZBQi3gH-rfN5X-cA_jo_1761227660
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Martin Kletzander <mkletzan@redhat.com>

This will allow the use of pinned_init crate which does not support
tuple structs.

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 rust/util/src/timer.rs | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/rust/util/src/timer.rs b/rust/util/src/timer.rs
index a99ff5e7ef7a..bc6297214525 100644
--- a/rust/util/src/timer.rs
+++ b/rust/util/src/timer.rs
@@ -17,14 +17,18 @@
 /// A safe wrapper around [`bindings::QEMUTimer`].
 #[repr(transparent)]
 #[derive(Debug, common::Wrapper)]
-pub struct Timer(Opaque<bindings::QEMUTimer>);
+pub struct Timer {
+    inner: Opaque<bindings::QEMUTimer>,
+}
 
 unsafe impl Send for Timer {}
 unsafe impl Sync for Timer {}
 
 #[repr(transparent)]
 #[derive(common::Wrapper)]
-pub struct TimerListGroup(Opaque<bindings::QEMUTimerListGroup>);
+pub struct TimerListGroup {
+    inner: Opaque<bindings::QEMUTimerListGroup>,
+}
 
 unsafe impl Send for TimerListGroup {}
 unsafe impl Sync for TimerListGroup {}
@@ -42,7 +46,7 @@ impl Timer {
     /// [`modify`](Self::modify).
     pub const unsafe fn new() -> Self {
         // SAFETY: requirements relayed to callers of Timer::new
-        Self(unsafe { Opaque::zeroed() })
+        Self { inner: unsafe { Opaque::zeroed() } }
     }
 
     /// Create a new timer with the given attributes.
-- 
2.51.0


