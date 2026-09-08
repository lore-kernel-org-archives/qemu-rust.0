Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D71C79F99
	for <qemu-rust@archiver.kernel.org>; Tue,  8 Sep 2026 17:38:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1x3zmL-0006Nh-4H; Tue, 08 Sep 2026 13:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1x3zmJ-0006NH-Tp
 for qemu-rust@nongnu.org; Tue, 08 Sep 2026 13:38:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1x3zmG-0000e1-5a
 for qemu-rust@nongnu.org; Tue, 08 Sep 2026 13:38:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788889111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UxwWpvJuIx7L+pTUhfla9Ag14gUSdLkdhZoScBOjn4c=;
 b=h9pnaLw1dBQoEmC3tggrSdyiD2t4snUf2T0DbNEObMMI99QsVvnIvjpMRhEBMNeYIvxkK3
 NumiZkQxJLH28oLziAEskpIq651aT9tn51PRWGCIUKzTledRueKrMPyKcwpgV/o4p9eHyU
 3HMmJ7bNo6Jpc8PtRWMgeh1nW2zh8A0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-O-_tgQfeN8y7rOxTFYWeTA-1; Tue, 08 Sep 2026 13:38:30 -0400
X-MC-Unique: O-_tgQfeN8y7rOxTFYWeTA-1
X-Mimecast-MFC-AGG-ID: O-_tgQfeN8y7rOxTFYWeTA_1788889109
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4858e4b3e92so2116803f8f.3
 for <qemu-rust@nongnu.org>; Tue, 08 Sep 2026 10:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788889109; x=1789493909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UxwWpvJuIx7L+pTUhfla9Ag14gUSdLkdhZoScBOjn4c=;
 b=kkCuz3jVYcNLue+8zcmZrZRSJiGHMlk1uAHvYgffDI+CZf56E92abbxVbVtpX5uYbp
 DjlUHqPcrTkhKru9SDQAbDPjGaY/7/TKCX7HZTFJVhe0C44iSFsuByg/97iYQafE1q8M
 C2PB2gzCqCltP77XTdVZHXE/qS3pt02F6IoKctwT2AAdhzc6jiDPAWtxWHG3GzfDLUH5
 MM9+nNR0hPUjog78VeFI+M4e1plUTEiBUoJxafx/0eiSKGTxqklS8zRNkZRSLESA8oV6
 JFQXGbAi5EbQU6QILwD9oFtzrVOctapdizYIeY931BFgqHDH9j9j8p8Be87vJdjc4zCU
 WmJA==
X-Gm-Message-State: AFuF++kIQMDJk7/0qE/x1DQHRiF+O6MvSYISfk1fjKeODtQJsbAgnM1G
 b49hWq7p+lE+MJTy3JzWPpPXNoC2pQfporntC+53fxBNaYp0fVUE7SAnRAf3+nRqpIA0KONZ9pY
 /Ur28xTTJhGiINZvafly7WcslYlVwiw3SXI+1LUz2Dr/XyWERx3W2aLI=
X-Gm-Gg: AYBFou0Z/n68TglzJi87WgZf6IT86T1kBjSxVOR4WM0Xkf/8Z5nYjOlCp0xDWd+YZeW
 IU31x0qxTgp1ME37kGMvTGmvkS6CGEeCi8KqRefexJ9g7H6NOyXcFRl+k8Bx6cWVQXJg/4qKoLW
 ebD5o0C73+KgFrxYLTuKdnY1+fS+xYswYgTCVgD4ccTZ5vstlbcSB8B4eQaBUnBmpzcKjsv49lt
 c09wxfMRSKeiQ8C/XjfCyRM2eASnC9m2wxC6nOS6rIC/WFL26gElA4F7t6ZKZ3gCtiqzAi9hUTa
 NQwLwdpVtrygKT3GfAn6ctRkP/WZGHp2JFFlqFk0THFn96vp1HkUrNvvBEXJ5YMTEiAo8v88uAN
 cAPu8QZ3EuhJH50QSRiySUpoqMqzBpYRM+nrPmC8W3EQyXPmAzA5nhUEePvV5PubBxmKGxABJfI
 mlUfTR
X-Received: by 2002:a05:6000:4694:b0:482:f724:f4ba with SMTP id
 ffacd0b85a97d-485872a6449mr25997530f8f.19.1788889108875; 
 Tue, 08 Sep 2026 10:38:28 -0700 (PDT)
X-Received: by 2002:a05:6000:4694:b0:482:f724:f4ba with SMTP id
 ffacd0b85a97d-485872a6449mr25997491f8f.19.1788889108411; 
 Tue, 08 Sep 2026 10:38:28 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.232.249])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485958f1493sm26186486f8f.37.2026.09.08.10.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 10:38:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] rust: bindings: disable more clippy warnings
Date: Tue,  8 Sep 2026 19:38:26 +0200
Message-ID: <20260908173826.867616-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L7bW79YHg6uWC5CyCRUsiWvfZgpAE8aBDpEMzZwYk7I_1788889109
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The clippy::complexity category includes manual_div_ceil, which triggers
with e.g. bindgen 0.73.2.  It is not really relevant to automatically
generated code so drop it from all bindgen crates, but keep it
enabled on purpose for other code.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Cargo.toml                         | 1 +
 rust/bindings/chardev-sys/lib.rs   | 1 +
 rust/bindings/hwcore-sys/lib.rs    | 1 +
 rust/bindings/migration-sys/lib.rs | 1 +
 rust/bindings/qom-sys/lib.rs       | 1 +
 rust/bindings/system-sys/lib.rs    | 1 +
 rust/bindings/util-sys/lib.rs      | 1 +
 7 files changed, 7 insertions(+)

diff --git a/Cargo.toml b/Cargo.toml
index 397a64ea99b..b6b6d97dfec 100644
--- a/Cargo.toml
+++ b/Cargo.toml
@@ -47,6 +47,7 @@ redundant_explicit_links = "deny"
 # default-warn lints
 result_unit_err = "allow"
 manual_checked_ops = "deny"
+manual_div_ceil = "deny"
 should_implement_trait = "deny"
 # can be for a reason, e.g. in callbacks
 unused_self = "allow"
diff --git a/rust/bindings/chardev-sys/lib.rs b/rust/bindings/chardev-sys/lib.rs
index 903f6fc492a..61c19412b07 100644
--- a/rust/bindings/chardev-sys/lib.rs
+++ b/rust/bindings/chardev-sys/lib.rs
@@ -8,6 +8,7 @@
     non_upper_case_globals,
     unnecessary_transmutes,
     unsafe_op_in_unsafe_fn,
+    clippy::complexity,
     clippy::pedantic,
     clippy::restriction,
     clippy::style,
diff --git a/rust/bindings/hwcore-sys/lib.rs b/rust/bindings/hwcore-sys/lib.rs
index 8cef4a79619..cecbf808dd0 100644
--- a/rust/bindings/hwcore-sys/lib.rs
+++ b/rust/bindings/hwcore-sys/lib.rs
@@ -8,6 +8,7 @@
     non_upper_case_globals,
     unnecessary_transmutes,
     unsafe_op_in_unsafe_fn,
+    clippy::complexity,
     clippy::pedantic,
     clippy::restriction,
     clippy::style,
diff --git a/rust/bindings/migration-sys/lib.rs b/rust/bindings/migration-sys/lib.rs
index c8397dc8974..4d13dc3cb2b 100644
--- a/rust/bindings/migration-sys/lib.rs
+++ b/rust/bindings/migration-sys/lib.rs
@@ -8,6 +8,7 @@
     non_upper_case_globals,
     unnecessary_transmutes,
     unsafe_op_in_unsafe_fn,
+    clippy::complexity,
     clippy::pedantic,
     clippy::restriction,
     clippy::style,
diff --git a/rust/bindings/qom-sys/lib.rs b/rust/bindings/qom-sys/lib.rs
index 21b996aeaa4..6b5c562951d 100644
--- a/rust/bindings/qom-sys/lib.rs
+++ b/rust/bindings/qom-sys/lib.rs
@@ -8,6 +8,7 @@
     non_upper_case_globals,
     unnecessary_transmutes,
     unsafe_op_in_unsafe_fn,
+    clippy::complexity,
     clippy::pedantic,
     clippy::restriction,
     clippy::style,
diff --git a/rust/bindings/system-sys/lib.rs b/rust/bindings/system-sys/lib.rs
index 30adf683c35..2dd5c7fc926 100644
--- a/rust/bindings/system-sys/lib.rs
+++ b/rust/bindings/system-sys/lib.rs
@@ -8,6 +8,7 @@
     non_upper_case_globals,
     unnecessary_transmutes,
     unsafe_op_in_unsafe_fn,
+    clippy::complexity,
     clippy::pedantic,
     clippy::restriction,
     clippy::style,
diff --git a/rust/bindings/util-sys/lib.rs b/rust/bindings/util-sys/lib.rs
index 0212e941843..f78064e52cd 100644
--- a/rust/bindings/util-sys/lib.rs
+++ b/rust/bindings/util-sys/lib.rs
@@ -8,6 +8,7 @@
     non_upper_case_globals,
     unnecessary_transmutes,
     unsafe_op_in_unsafe_fn,
+    clippy::complexity,
     clippy::pedantic,
     clippy::restriction,
     clippy::style,
-- 
2.55.0


