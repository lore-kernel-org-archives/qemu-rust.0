Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BBECCA470
	for <qemu-rust@archiver.kernel.org>; Wed,  1 Oct 2025 08:06:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3rmx-0005x9-DG; Wed, 01 Oct 2025 04:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rmu-0005wm-Vv
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:02:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rmL-0006CQ-TR
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759305691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7VTQDRhx35WZbHde5Mr6+wFWJHKfg1tDAJgNYHuAiso=;
 b=Te1k8Lnr6rDb1MYo+pDpL+B0Ux1OPpgzLIi2ihQBD9c8o3drKxwR7JRHucreSQe6QF3zkV
 +sIL7hiAozIj/w+4fTIlij6NzObnMDxNVoEp433ctDbyTgWJTFQrpTgl2uuWK8fbsPm9US
 Uh4x4yp6ZW12dV5F4ESn1kC58tkSDYQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-c6bTb6hLN4OAObWnfwSllw-1; Wed, 01 Oct 2025 04:01:30 -0400
X-MC-Unique: c6bTb6hLN4OAObWnfwSllw-1
X-Mimecast-MFC-AGG-ID: c6bTb6hLN4OAObWnfwSllw_1759305688
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-634b661347bso6676419a12.3
 for <qemu-rust@nongnu.org>; Wed, 01 Oct 2025 01:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759305688; x=1759910488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7VTQDRhx35WZbHde5Mr6+wFWJHKfg1tDAJgNYHuAiso=;
 b=EYbida5EK5uD0JaRLxIdICNcnz96J+KIbnEd58w4t171xoY5cWxuB4NE1+6WAwwWaB
 QKHL84eztL1sI+/1A832REVfEoJgLC5xh2LdUCdmwz8UU808YKI3wmV0l+gJ1JNhvlvS
 10WVv0ShuKeLdF8ArG47UxGVOvXTnHrwC2H5q3L/Mbb5APmxMOgOeXYLrWUlpKRyR8Ah
 PRm4JjPAA7iV8PHa3+xpNupfIsL8WlIV1GBa9UpCJ8PGFUMGgoEVV95Knhbm8EzGohxd
 0BGBn1pakFECE6RO3Lo+ViHbkEKAfVamWDe2SwZTRksJh37I4qOAk4R2Y0lSaOKT6y8T
 CFag==
X-Gm-Message-State: AOJu0Ywq/sCnmSvAY6jppyZjW+pOmhJFC3AhIuNgtPaVVdUCYp0nDCBI
 TQ9dnEo3uFkHc2HOU//m+vZcwHoRfvqs5B1YAMqMJpIyl/RXuX7z1oO602REbmAViInAoOtXTSa
 ganrUN0bXNEjXkImg4i0hsOsmipfcpxxgcK2QTYZmt8xdzILXzWgKIv4=
X-Gm-Gg: ASbGncv3CylFdc+4ubXU05UXErVr2b4WjyBQIduS8UyrutbFkTNPcl2VWPlKgC5+M0Q
 N+CrR0CJDXqdJwRWhkIzcuRbU7wiLN4LVZZTQFdZmbDO2bXRZjpFDs4HjzACCsDhr5aGd/uHYo7
 4D/6DOCAJqfMhhy94uoUyBrcaDD7SWt4HS/rt76vPodCtkcuudKA96MIFvq9fm0HF84ZW0CsyJf
 f4aZqwdKQSa1Wyc7IOKhy+tmTHOvRTNoVLcoJu4nJCbKN/OKcihKYBJfo+AbYrIpaMXoxSO3iqy
 U4vHo2WKAtKKhcSUsI56l3bXxXEVMGtwySMHHa5EBSqgQ2JXvHSHoIq4zgnopeA0LuaGwstflPk
 qcvTXSfXcmgVjL+apPvaz3oRkmYx4FSXOf4aH2UMOeMwst7A5cPk=
X-Received: by 2002:a05:6402:d0e:b0:62f:5b56:423d with SMTP id
 4fb4d7f45d1cf-63678c35d1amr3061433a12.14.1759305687680; 
 Wed, 01 Oct 2025 01:01:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBhZUoyzAoLafyKGpv93i4OVNhbldjJJXNhr57MNWxJilswEObaVoYuu296FmUVSxVfOEgDA==
X-Received: by 2002:a05:6402:d0e:b0:62f:5b56:423d with SMTP id
 4fb4d7f45d1cf-63678c35d1amr3061396a12.14.1759305687221; 
 Wed, 01 Oct 2025 01:01:27 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a3ae3080sm11534670a12.34.2025.10.01.01.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 01:01:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH 14/14] rust: start qapi tests
Date: Wed,  1 Oct 2025 10:00:51 +0200
Message-ID: <20251001080051.1043944-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001075005.1041833-1-pbonzini@redhat.com>
References: <20251001075005.1041833-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u4g5ZcS3XnEZdIgovZ9Ra8N5KegLK5bF_7seb4TjPQ0_1759305688
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/tests/meson.build          | 10 +++++++---
 rust/tests/tests/integration.rs |  2 ++
 rust/tests/tests/qapi.rs        | 35 +++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 rust/tests/tests/integration.rs
 create mode 100644 rust/tests/tests/qapi.rs

diff --git a/rust/tests/meson.build b/rust/tests/meson.build
index 00688c66fb1..c36cab1886e 100644
--- a/rust/tests/meson.build
+++ b/rust/tests/meson.build
@@ -1,11 +1,15 @@
 test('rust-integration',
     executable(
         'rust-integration',
-        files('tests/vmstate_tests.rs'),
+        files(
+            'tests/integration.rs',
+            'tests/vmstate_tests.rs',
+            'tests/qapi.rs',
+        ),
         override_options: ['rust_std=2021', 'build.rust_std=2021'],
-        rust_args: ['--test'],
+        rust_args: ['--test'] + _qapi_cfg,
         install: false,
-        dependencies: [bql_rs, common_rs, util_rs, migration_rs, qom_rs]),
+        dependencies: [bql_rs, common_rs, util_rs, migration_rs, qom_rs, qapi_rs]),
     args: [
         '--test', '--test-threads', '1',
         '--format', 'pretty',
diff --git a/rust/tests/tests/integration.rs b/rust/tests/tests/integration.rs
new file mode 100644
index 00000000000..ebc17cb5550
--- /dev/null
+++ b/rust/tests/tests/integration.rs
@@ -0,0 +1,2 @@
+mod qapi;
+mod vmstate_tests;
diff --git a/rust/tests/tests/qapi.rs b/rust/tests/tests/qapi.rs
new file mode 100644
index 00000000000..3a54d37edaa
--- /dev/null
+++ b/rust/tests/tests/qapi.rs
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#![allow(unexpected_cfgs)]
+
+use qapi;
+use util::qobject::{from_qobject, to_qobject};
+
+#[test]
+fn test_qapi() {
+    let sa = qapi::InetSocketAddress {
+        host: "host-val".to_string(),
+        port: "port-val".to_string(),
+        numeric: None,
+        to: None,
+        ipv4: None,
+        ipv6: None,
+        keep_alive: None,
+        #[cfg(HAVE_TCP_KEEPCNT)]
+        keep_alive_count: None,
+        #[cfg(HAVE_TCP_KEEPIDLE)]
+        keep_alive_idle: Some(42),
+        #[cfg(HAVE_TCP_KEEPINTVL)]
+        keep_alive_interval: None,
+        #[cfg(HAVE_IPPROTO_MPTCP)]
+        mptcp: None,
+    };
+
+    // let qi: QObject = 32.into();
+    // dbg!(&qi);
+
+    let qsa = to_qobject(&sa).unwrap();
+    let _json = qsa.to_json();
+    let sa: qapi::InetSocketAddress = from_qobject(qsa).unwrap();
+    dbg!(sa);
+}
-- 
2.51.0


