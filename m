Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620F6D116EA
	for <qemu-rust@archiver.kernel.org>; Fri, 28 Nov 2025 09:42:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vOv0A-0003dU-7Y; Fri, 28 Nov 2025 04:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vOv09-0003dA-JC
 for qemu-rust@nongnu.org; Fri, 28 Nov 2025 04:42:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vOv07-0007ym-Je
 for qemu-rust@nongnu.org; Fri, 28 Nov 2025 04:42:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764322969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KAbRuebQpS5YcNDD4J2eZLQvWeeGyNZf76fc2t913LI=;
 b=MZ70a8FgGj+zFSNljsV8lKG6yPAReOu9CikQDNpg+ByggA6Q5X96bLwEPfPl0Rvwvjlkl7
 SUkOv3dy8RDJGFfLfL9bGgW+S865bNdgj7M23TrTEAPty9QkBkiDFoh/5TmqAW3v6STRAZ
 I/4v5gTCh6am3RGPXelc/PmzpfGgTck=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-qov_QfVtNqaoIe736dDigA-1; Fri, 28 Nov 2025 04:42:48 -0500
X-MC-Unique: qov_QfVtNqaoIe736dDigA-1
X-Mimecast-MFC-AGG-ID: qov_QfVtNqaoIe736dDigA_1764322967
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b735eea0bddso115570066b.2
 for <qemu-rust@nongnu.org>; Fri, 28 Nov 2025 01:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764322966; x=1764927766;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KAbRuebQpS5YcNDD4J2eZLQvWeeGyNZf76fc2t913LI=;
 b=TsunNGA8FQtFL5lYJlM5EpUBrqLIqKofEmziMdbOS3EPqVwcGo4SR2zESAgSIRO8oS
 XtaY7xxECtXEjgEuOsFMP7kJF2JlMflX1jaN1dTD7wzWDLsQ1yuxIXZiTFli93ZMJdbR
 kdUNNv4DRIA3gUkFD5WrGjEy25K3FIAfw61E2d6B3MJJm/5wBnzuNWWBmRAGdFjtORhp
 mtn4jv/Fd4QjBbaKwljFZkm/4ROq6f5yfvIbui0Aq4F5jouUJigCWgTvld+P3UvAYEb8
 jQnBRYeOzqALuMW1lCyi0eaykyf9t+7+GFlARQURJTCDdZpWNdvXEHpjWqQaKd4vNKe2
 /4VA==
X-Gm-Message-State: AOJu0YyWa9gttqMRuIGkiMdPhNow2wu9fmeMze9CJKR2qE+mBiSNY9OY
 HEhRXh2iLu0z656Uif40RODb+5LuimC+LrdvPwMry3osqeBOORr68wfdgARIzMXmL/pDmBPs3z8
 9mUsLxt+u1vdt4XC7Q0kE29PtDSQPLK40VDk1ALXFqKhLj650mQ26HCSx7Zh6D2Q=
X-Gm-Gg: ASbGncu9oRxlva7OzfM2dg9zxSaeDbwF1aau9zf/HMNozcZF4yc601nKRW9NverF2RN
 /6+YiKYyW6zzrvvtXXtwVjNZNBr/dQPqrSy7hxU+Ml0UuWwDZFd2DOEWFIy9UXWF80AzPqTDBYX
 1+qzycyGZCQvWudq2W2pHtuXYu3mvntpDn20WAum7xQnl98aEOFIhbpO8ao3bnagyzs5s0MRCEJ
 DJjDcgU4+FG+wuui1yvEhjC0hme5NQTnby5tM6Zo9MwHkfpg7JRvMTe8GQIBnfhgYXSFxvczfDX
 bhVwGHwvc/Iciu/ASwRwFhwY/tLEP/CPgbvpaiI1dQETQ2zkPbOCsVhLDFaLFx9PmOTq6w8UtRq
 iqkrPCnfzK266/OS4TMJ3ZNrG3j5kLDNH+pubM6VO7xFSR5QXdjHpi1xoxZ3a41z2bs4NA5kgG1
 SCvuuYu9DKoExpFis=
X-Received: by 2002:a17:907:2d20:b0:b73:8bdd:eec9 with SMTP id
 a640c23a62f3a-b7671558a7dmr3102719866b.5.1764322966491; 
 Fri, 28 Nov 2025 01:42:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIOzOUuiiWm3D2OJnQklqF1IDhiXRoxgpcyZMJlR+oeevanI4Z3+lfcQasy5HljeJd8hSNSQ==
X-Received: by 2002:a17:907:2d20:b0:b73:8bdd:eec9 with SMTP id
 a640c23a62f3a-b7671558a7dmr3102717066b.5.1764322965975; 
 Fri, 28 Nov 2025 01:42:45 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f59aebecsm390140966b.39.2025.11.28.01.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 01:42:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH] rust: workaround compilation failures with Meson <1.10
Date: Fri, 28 Nov 2025 10:42:44 +0100
Message-ID: <20251128094244.208571-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7A-BMrHPCsQ8sq4-8v0KspK3rtRjhqcqlrskeqXWr1A_1764322967
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.224,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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

Prior to Meson 1.10, if the config-host.h dependency of qemuutil ends up
as the first source file, it can be passed to rustc---which gets rather
confused because config-host.h looks nothing like Rust code.

While this can usually be avoided in the individual targets, a simple
and universal workaround is to remove the sources (and C compile
arguments, while at it) from the "util_rs" dependency.  This hides
config-host.h from the Rust targets---and they don't need it anyway.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/util/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/rust/util/meson.build b/rust/util/meson.build
index 95aa211ef0b..2aa32a233eb 100644
--- a/rust/util/meson.build
+++ b/rust/util/meson.build
@@ -41,7 +41,9 @@ _util_rs = static_library(
   dependencies: [anyhow_rs, libc_rs, foreign_rs, glib_sys_rs, common_rs],
 )
 
-util_rs = declare_dependency(link_with: [_util_rs], dependencies: [qemuutil, qom])
+util_rs = declare_dependency(link_with: [_util_rs], dependencies: [
+  qemuutil.partial_dependency(links: true, link_args: true),
+  qom])
 
 rust.test('rust-util-tests', _util_rs,
           dependencies: [qemuutil, qom],
-- 
2.51.1


