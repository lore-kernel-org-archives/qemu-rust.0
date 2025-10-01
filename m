Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2D6CAC5BB
	for <qemu-rust@archiver.kernel.org>; Wed,  1 Oct 2025 15:39:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3yob-0001pl-Pm; Wed, 01 Oct 2025 11:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1v3yoQ-0001lr-Bh
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 11:32:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1v3ynq-0005wq-Cy
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 11:32:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759332692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yzuv4TcJRCREAhbb9oTsk4FxwR25JxF2LGHUpZevxWM=;
 b=CbnifEJRPjnW5oCxn/UnpBll2pc1NPSFPYPzv6gm45H42fcYaLakBhmMfnfbwqDkPGsX0I
 YvLzMbgnzCrHjjarplhfE5v+SgOshMk2HAdlGTSuNwyWhuMa4n1XYQqJsmWTonzWoIXbIi
 nt5JQDID4QCQVkylLBdfX52yMPQDM2I=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-131-mzwQqcMUNmWEpufQTUTpfw-1; Wed,
 01 Oct 2025 11:31:30 -0400
X-MC-Unique: mzwQqcMUNmWEpufQTUTpfw-1
X-Mimecast-MFC-AGG-ID: mzwQqcMUNmWEpufQTUTpfw_1759332687
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4B9DB195609E; Wed,  1 Oct 2025 15:31:27 +0000 (UTC)
Received: from localhost (unknown [10.2.16.112])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6F8FE195395C; Wed,  1 Oct 2025 15:31:25 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bandan Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-rust@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Cleber Rosa <crosa@redhat.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Mads Ynddal <mads@ynddal.dk>,
 Alexandre Iooss <erdnaxe@crans.org>, John Snow <jsnow@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PULL 10/16] rust: qdev: add minimal clock bindings
Date: Wed,  1 Oct 2025 11:30:53 -0400
Message-ID: <20251001153059.194991-11-stefanha@redhat.com>
In-Reply-To: <20251001153059.194991-1-stefanha@redhat.com>
References: <20251001153059.194991-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.518,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

From: Paolo Bonzini <pbonzini@redhat.com>

Add the minimal support that is needed by pl011's event and tracepoint.

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20250929154938.594389-11-pbonzini@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 rust/hw/core/src/qdev.rs | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/rust/hw/core/src/qdev.rs b/rust/hw/core/src/qdev.rs
index a4493dbf01..c3097a284d 100644
--- a/rust/hw/core/src/qdev.rs
+++ b/rust/hw/core/src/qdev.rs
@@ -411,6 +411,39 @@ fn init_gpio_out(&self, pins: &[InterruptSource]) {
 
 impl<R: ObjectDeref> DeviceMethods for R where R::Target: IsA<DeviceState> {}
 
+impl Clock {
+    pub const PERIOD_1SEC: u64 = bindings::CLOCK_PERIOD_1SEC;
+
+    pub const fn period_from_ns(ns: u64) -> u64 {
+        ns * Self::PERIOD_1SEC / 1_000_000_000
+    }
+
+    pub const fn period_from_hz(hz: u64) -> u64 {
+        if hz == 0 {
+            0
+        } else {
+            Self::PERIOD_1SEC / hz
+        }
+    }
+
+    pub const fn period_to_hz(period: u64) -> u64 {
+        if period == 0 {
+            0
+        } else {
+            Self::PERIOD_1SEC / period
+        }
+    }
+
+    pub const fn period(&self) -> u64 {
+        // SAFETY: Clock is returned by init_clock_in with zero value for period
+        unsafe { &*self.0.as_ptr() }.period
+    }
+
+    pub const fn hz(&self) -> u64 {
+        Self::period_to_hz(self.period())
+    }
+}
+
 unsafe impl ObjectType for Clock {
     type Class = ObjectClass;
     const TYPE_NAME: &'static CStr =
-- 
2.51.0


