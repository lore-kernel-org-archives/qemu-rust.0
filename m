Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DB8CA0FED
	for <qemu-rust@archiver.kernel.org>; Wed, 27 Aug 2025 10:46:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1urDe9-0008NG-Si; Wed, 27 Aug 2025 06:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1urDdt-0007xl-RX
 for qemu-rust@nongnu.org; Wed, 27 Aug 2025 06:44:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1urDdr-0003JT-Rg
 for qemu-rust@nongnu.org; Wed, 27 Aug 2025 06:44:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756291472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wdijyZJTw4dcfmM6tUCNHUNSwwMQWV+6B905FXPZXbI=;
 b=iaQW9dGqPmTHV4ydwmQO9wt+u2KGDRp1zgnR/jyRf+LBRNoxJ/ZjKQ5MZgzJmtcO50IJI3
 qHUu2/W6BCWEgL6YPE8QhA38yMmKMknDO5gMRaHBcAdbvqLFpEGlL/R9ZvhsPN8F7tr909
 IwhAf0rKfq9F2NFX3TeJLLHojLVjjcA=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-241-3JsTuU7kPCObK2-CxCGXbA-1; Wed,
 27 Aug 2025 06:44:31 -0400
X-MC-Unique: 3JsTuU7kPCObK2-CxCGXbA-1
X-Mimecast-MFC-AGG-ID: 3JsTuU7kPCObK2-CxCGXbA_1756291470
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2E50819560AE; Wed, 27 Aug 2025 10:44:30 +0000 (UTC)
Received: from localhost (unknown [10.45.242.16])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4ED0030001A5; Wed, 27 Aug 2025 10:44:27 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH 20/22] rust: re-export qemu_macros internal helper in "bits"
Date: Wed, 27 Aug 2025 14:41:42 +0400
Message-ID: <20250827104147.717203-21-marcandre.lureau@redhat.com>
In-Reply-To: <20250827104147.717203-1-marcandre.lureau@redhat.com>
References: <20250827104147.717203-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Avoid the need to import "qemu_macros".

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 rust/bits/src/lib.rs | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/rust/bits/src/lib.rs b/rust/bits/src/lib.rs
index 4e091aebbd..db46b12ce6 100644
--- a/rust/bits/src/lib.rs
+++ b/rust/bits/src/lib.rs
@@ -380,14 +380,17 @@ fn from(x: $type) -> Self {
     };
 
     { $type:ty: $expr:expr } => {
-        ::qemu_macros::bits_const_internal! { $type @ ($expr) }
+        $crate::bits_const_internal! { $type @ ($expr) }
     };
 
     { $type:ty as $int_type:ty: $expr:expr } => {
-        (::qemu_macros::bits_const_internal! { $type @ ($expr) }.into_bits()) as $int_type
+        ($crate::bits_const_internal! { $type @ ($expr) }.into_bits()) as $int_type
     };
 }
 
+#[doc(hidden)]
+pub use qemu_macros::bits_const_internal;
+
 #[cfg(test)]
 mod test {
     bits! {
-- 
2.50.1


