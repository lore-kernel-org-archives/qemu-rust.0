Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E301AC5DF87
	for <qemu-rust@archiver.kernel.org>; Fri, 21 Aug 2026 08:40:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wxKmv-0004yU-Pi; Fri, 21 Aug 2026 04:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wxKmu-0004x7-48
 for qemu-rust@nongnu.org; Fri, 21 Aug 2026 04:39:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wxKms-0008Jz-Oe
 for qemu-rust@nongnu.org; Fri, 21 Aug 2026 04:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787301582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hjxLnAVY/DURtZa77LbXggflUPsLfOq7SYe7f/Hv64=;
 b=bEnUk+q9x1pmMIEuCfyBXdrLdKgd9vi3NDc5fPB+b6Dt10mVxjXZDIZU5OGU6nBheo+jvb
 Em3g/a6chhTOTz4d2YpjiR7UOZj7OaBZSya4cMXrsSjVF815Z1F8h7jNeykapd2iLdekCS
 QMQ1WbvcnxMCIkBq2RycDwSR+TH7u1w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-15wPVapfPpyTLv0xbIHhtw-1; Fri, 21 Aug 2026 04:39:30 -0400
X-MC-Unique: 15wPVapfPpyTLv0xbIHhtw-1
X-Mimecast-MFC-AGG-ID: 15wPVapfPpyTLv0xbIHhtw_1787301569
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-c15ff68c858so68302066b.0
 for <qemu-rust@nongnu.org>; Fri, 21 Aug 2026 01:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787301569; x=1787906369;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7hjxLnAVY/DURtZa77LbXggflUPsLfOq7SYe7f/Hv64=;
 b=Q4jsMzhHd71daTzMk1m0LPzf1rUUQzY05KffaNs5GHRdO8DCLLUkHA045SWTRPvPQi
 AsW5RPlcJOppP9jIP+ogNF6lbICesINmiGAhaaWcI7y/+2flPiHq+Y+kWHdo09iIS0Bg
 WxaQE5yIm7q9dL2XdZqhctzM9v/MImhQaqrDIZFz7t+819tGmkMREVt2qzDl/LNoSfaC
 b5UhExzYeoRNVxZ+9JwgotG++ecgSiB9r3ixOwD1cJvo9tEekyj8AJv0OYoRwbwN0/Xx
 W/ZQrnaIhUCbXjd19O0x9/5uhUplqgtcFEaxiu9HEqfXH1KKFE6in8eFcFD7scwqfCTF
 sJlA==
X-Gm-Message-State: AFuF++lSi8BHHH9cUXCTbPxGUzhkNgap6qoeFklDlBlvZN7bnKIkUQyd
 LS67lVXUGL/bQXY/lJs6SR3zsnMGGubV+FxzPpDwD/6N/5MEIytJ1QgZh/msEAfE6AhEiu1XM8P
 4MAUbMONsH0/EFZkBtf96RJUrn2q6C9GHxTnJsmk7b8GGCQpUlnYS0OI=
X-Gm-Gg: AR+sD11P9WmAqM/oLnEjF2VI5yR1NFDLWwF4VzaBBffPSEwq+v/I+b3HZRgHy/OPo3P
 M1fG4q4MJtTAygw6aLm82QcoLvfusfOaJ+qaxD3ak4qLDJ97xwmjliEJrYFq2n3PyCeFDDaY0X9
 te7O9U5X5SlPf+lFCtzYncqqa1GckkePet72m+OUiTk3FFIyE/53z0jvZK7trOA4EvmGeAVpTsh
 CR6PzGyXHzAztughWge/GZ1hcgjClc7zX2Z/RB2XBF0udzrw7r2+EOm+4b6KHaUmmrLfLjswcKk
 hlDVl0VvjGOdKD/BeAk4gPd/USnxPGAd+qb0CgvCiIYcMFK80JJC5lTzi8kUWPp8Yv4j5oZuiFY
 VqfYaG054zjRTzmd2uOHCNHC+xAEVUtaNq9D78bwHepUtDpQWuzf4Tu+fJsTfkQHnCXzh76j5Ht
 cBMKE=
X-Received: by 2002:a17:907:7256:b0:c21:49df:1650 with SMTP id
 a640c23a62f3a-c246a5eededmr424105966b.8.1787301569363; 
 Fri, 21 Aug 2026 01:39:29 -0700 (PDT)
X-Received: by 2002:a17:907:7256:b0:c21:49df:1650 with SMTP id
 a640c23a62f3a-c246a5eededmr424102666b.8.1787301568941; 
 Fri, 21 Aug 2026 01:39:28 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.34.92])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2459198d64sm330336766b.36.2026.08.21.01.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 01:39:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 1/9] scripts: print build.rs diff
Date: Fri, 21 Aug 2026 10:39:16 +0200
Message-ID: <20260821083925.2008135-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821083925.2008135-1-pbonzini@redhat.com>
References: <20260821083925.2008135-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QZGZmSV2Hf_IP6X1RVkhb2nboe1YFQGnKFMWfMcRT3A_1787301569
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.346,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/get-wraps-from-cargo-registry.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/get-wraps-from-cargo-registry.py b/scripts/get-wraps-from-cargo-registry.py
index 3820d121183..84c652127f9 100755
--- a/scripts/get-wraps-from-cargo-registry.py
+++ b/scripts/get-wraps-from-cargo-registry.py
@@ -59,8 +59,10 @@ def compare_build_rs(self, orig_dir: str, registry_namever: str) -> None:
             if os.path.isfile(new_build_rs):
                 msg = f"build.rs added in {registry_namever}"
 
-        elif os.path.isfile(orig_build_rs) and not filecmp.cmp(orig_build_rs, new_build_rs):
+        elif os.path.isfile(orig_build_rs) and not filecmp.cmp(orig_build_rs, new_build_rs, shallow=False):
             msg = f"build.rs changed from {orig_dir} to {registry_namever}"
+            # diff exits non-zero when the files differ, which is expected here
+            subprocess.run(["diff", "-u", orig_build_rs, new_build_rs])
 
         if msg:
             print(f"⚠️  Warning: {msg}")
-- 
2.55.0


