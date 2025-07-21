Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AED1C83F25
	for <qemu-rust@archiver.kernel.org>; Mon, 21 Jul 2025 10:53:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1udo8Z-0004vk-Ko; Mon, 21 Jul 2025 06:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1udo8V-0004pw-NX
 for qemu-rust@nongnu.org; Mon, 21 Jul 2025 06:52:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1udo8U-0002CV-3H
 for qemu-rust@nongnu.org; Mon, 21 Jul 2025 06:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753095163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SKZhYrhLklT7wy5r7XGVHBie6wvhRMRWF/tewAfL1Jk=;
 b=IYhDLC34gj+d9WRFKkjntASuhBLY/ZyurusiTHGLjk75s3T95nA3woTqP98B1KYubpniKQ
 cdv0yJkjkqdrnbgEdLPqof/l4mPALz6tTkEfgB5XHBF7kq9NZAoqmKetIt0iQ6dificn4F
 zusON07vV7FptAPXNryIXWa3G8ryaYY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-tbBmgzCsPmCKuf7uaO8pGQ-1; Mon, 21 Jul 2025 06:52:42 -0400
X-MC-Unique: tbBmgzCsPmCKuf7uaO8pGQ-1
X-Mimecast-MFC-AGG-ID: tbBmgzCsPmCKuf7uaO8pGQ_1753095161
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-451d2037f1eso27917665e9.0
 for <qemu-rust@nongnu.org>; Mon, 21 Jul 2025 03:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753095160; x=1753699960;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SKZhYrhLklT7wy5r7XGVHBie6wvhRMRWF/tewAfL1Jk=;
 b=PrQEMFPcbJm8H2RpmE6PdNfJMawpXtxs6Hs0yy4gSDmX/Oj+G+9Dw6LF2AEJCF4Ezq
 HHQpIX2vdhulqQr4wgeImzgDCpzf/27krBLcx/Vg7/jh6TVLuIdZRWdassOTBC1UqCoU
 i2RxVx1xANCNfgr8wplSkZ3scGfdZgkqRY6cspUB5as9mcZVC+HsF2PEIYNG+55MH0yJ
 Fdb1AtuizNssLOnJPqEdgJBq0i0qQs4geZ/KSDXlkq18h423SNxho2Bxqra0VXf1kGfg
 IuGfZWazB6QB2mGcteUH00fgP7pcr5FFIxISobHfVz+hTfXbWFxiu12d0TvhYsQgHb+4
 I3JQ==
X-Gm-Message-State: AOJu0YzCUKeJNZJOrgNZK3w47IlYrHbvbVYnm4oYKN/nApUb8Ch7zkef
 psoxFrwG5bxllGLUxv99UpknxBMvZQb82vyBA6nx9GJaHrEweZ05m/A4nTE9dRMgzJGpCEXYJ81
 gfaHd/9LVcH4fvjTaCPDal5JVEPlWPo7QF+plr+vPLxMbScFp4N8CjEYjEROo3gA=
X-Gm-Gg: ASbGnctvwAF+Q9A3VYXI4e8HzwyOUYEOHx+c7ONmVklT7vTNGVZfa70XfGgISpG2945
 L/b/k/Hijpg4yh89S1MIpxz1tTuCPgOaMPQVTWWhTR0H7syNrYfoTl6/1UOmlsBZE+KKXmm+ZZH
 XKaK/Qmyx+DYhxc3RtKFLmlpRWUIL3NNzp1FBQiADrbgWAWLu1JQKyaUEoFtLtdMd34NP5ut17M
 svQb1QJ/6C3Ubq0xQJRU2ZHlQMXs0KzZCWCHkSfSUn50pPawB7nmya56xPnOoQKUfDT79X/Clfz
 slB1ReuOZop3tmJzgqPwpmujp2sfexfM78vGO+rLkfk=
X-Received: by 2002:a05:600c:3d96:b0:456:c48:491f with SMTP id
 5b1f17b1804b1-4562e3548f0mr236287025e9.10.1753095160532; 
 Mon, 21 Jul 2025 03:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF380oqN9iIkN4CvENPijA20YfTvZfRqEV1lKgxIilS3tOzmQTVhWO176QuhwEitXQeJ85ZYQ==
X-Received: by 2002:a05:600c:3d96:b0:456:c48:491f with SMTP id
 5b1f17b1804b1-4562e3548f0mr236286745e9.10.1753095160141; 
 Mon, 21 Jul 2025 03:52:40 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.73.155])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca5c9edsm10155226f8f.88.2025.07.21.03.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 03:52:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH] rust: devices are not staticlibs
Date: Mon, 21 Jul 2025 12:52:38 +0200
Message-ID: <20250721105238.461477-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wQcX5oV8LAvoA9tdoToYR6GAVHyx3KKkzL3QltKWP0Q_1753095161
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.926,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This is only cosmetic for now, but hopefully later on Meson will parse more
of Cargo.toml.  Devices are linked into a staticlib but are not staticlibs
themselves.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/Cargo.toml | 3 ---
 rust/hw/timer/hpet/Cargo.toml | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/rust/hw/char/pl011/Cargo.toml b/rust/hw/char/pl011/Cargo.toml
index 003ef9613d4..88ef110507d 100644
--- a/rust/hw/char/pl011/Cargo.toml
+++ b/rust/hw/char/pl011/Cargo.toml
@@ -12,9 +12,6 @@ license.workspace = true
 repository.workspace = true
 rust-version.workspace = true
 
-[lib]
-crate-type = ["staticlib"]
-
 [dependencies]
 bilge = { version = "0.2.0" }
 bilge-impl = { version = "0.2.0" }
diff --git a/rust/hw/timer/hpet/Cargo.toml b/rust/hw/timer/hpet/Cargo.toml
index 6f075027843..ac5df23c1d0 100644
--- a/rust/hw/timer/hpet/Cargo.toml
+++ b/rust/hw/timer/hpet/Cargo.toml
@@ -10,9 +10,6 @@ license.workspace = true
 repository.workspace = true
 rust-version.workspace = true
 
-[lib]
-crate-type = ["staticlib"]
-
 [dependencies]
 qemu_api = { path = "../../../qemu-api" }
 qemu_api_macros = { path = "../../../qemu-api-macros" }
-- 
2.50.1


