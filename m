Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DD1CCA476
	for <qemu-rust@archiver.kernel.org>; Wed,  1 Oct 2025 08:03:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3rmW-0005nl-P9; Wed, 01 Oct 2025 04:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rmN-0005k9-HF
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:01:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rm4-00065Z-F9
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:01:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759305678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hJgKnO4p5NCBfsiH7X9uVt6uTBPOKNgBfFsL5Wo3g90=;
 b=Amxu51+KAUDSixW2AQa9KhcHoI22d6w/Z1OK7/NMyrn7dIpXV9uHvtgvHzo9AWf+tevs0F
 w7y+aXkQYpRH2JdMMm3y4lTlfXLg+OCfmvmF9WP0L+iwo7Px726dQkU80c/oRAnExT+D9q
 L7lmXYoGMJ9FuNsGicQGOLvMA6rcNKo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-SoSvbIViM2yqhRUNSefmTg-1; Wed, 01 Oct 2025 04:01:16 -0400
X-MC-Unique: SoSvbIViM2yqhRUNSefmTg-1
X-Mimecast-MFC-AGG-ID: SoSvbIViM2yqhRUNSefmTg_1759305676
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b07c2924d53so590318966b.3
 for <qemu-rust@nongnu.org>; Wed, 01 Oct 2025 01:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759305676; x=1759910476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hJgKnO4p5NCBfsiH7X9uVt6uTBPOKNgBfFsL5Wo3g90=;
 b=dcGAQKT0/VqYZXC7ttAx+3oLpRQQeA7NuhQ7llemQ+wiNboUU7e7rFYnd4OEl9Pmss
 dkrjBDPwlSjgZfNaAGon0q9FjF/6TGUEDOY3Bm+f5Vh1CvgNaLhowC3vxFUazwmgNJj9
 zGSHOzz2KWYcrm4x/3uWdKTVtreLid47DC8jSs9LZ5CeVi3SR3GlE+sGHxIsn15t+p4O
 0Mnv3jOa2hhvlyAVNys9d+Xd0vn19AYINLGlRxleqnZ9YzkLGizadF9v+nxGraoJsIsN
 T/Gr/V1pVj1MhTP/Zvz4ceAo9QgZmu8mKbZCcwWw8+C574MTHoWNfJg8j5ABXZGHe9Cv
 vARQ==
X-Gm-Message-State: AOJu0YxWqlatdXBybKS7lpxJhX8105EXn3pss4tSzGf2FMfiqOO+h8t9
 hVD+8z8U/OE1/hBcUzlxBedmBy+9hSysV2AdOTDa9mUJJ99uLNLZDceT00r56qCB3h0YQcMveRa
 N7G44S7qvfPud3kTuOILMVEy2OvSNu7EwA1WLSvopEezV26g/sRO42pc=
X-Gm-Gg: ASbGncuXNTgF4CEPjnV+DFS241jmTMmmpZJwIbGIVcsBj7VmJrAYQGt6R7ga4kR6d2t
 14AE4zqFBKOoIO2YQbhwzO6xbJVp8AJ4QcgSjoBhExFVoBnDIW5PJIsbHaoKWHPpiJE8s7PHhmK
 HuwLLhfZa1q3SrLO/VwJr1gUCS5ToPJYoSSRU6PI3W/vQEDUdtbnlxyVQ/PJm/5FBk2tZMordtq
 ItunTstycKf8oy0pPj8rifQvX02m7dqUoYsx7JcFqXzmna6mRxLGNfiCI9F/EHUa56pCKQfjSAG
 mdkvY+iEBWJEZTTcKdDp/wP9VfdoX5uKm5Epz/pJUY4+43232x+YSNFCd8ARy1ZDSwQjSpn2Lq7
 TFsbnaTcUqUWJ/LFfWxCftpAqwMTpLpJ6C+ApYsMA7r5LmoES2tY=
X-Received: by 2002:a17:907:6091:b0:b46:11fc:c9c7 with SMTP id
 a640c23a62f3a-b46ea12603bmr300771966b.58.1759305675527; 
 Wed, 01 Oct 2025 01:01:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3DU1jbhWKpbxM8wApBLCZ1fU7nyqCaO0q4aDqdD3DU3dX7hhCOLbTYSlEPqMSQLHorjZEnw==
X-Received: by 2002:a17:907:6091:b0:b46:11fc:c9c7 with SMTP id
 a640c23a62f3a-b46ea12603bmr300763566b.58.1759305674716; 
 Wed, 01 Oct 2025 01:01:14 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3f3b7eb5ffsm560470166b.90.2025.10.01.01.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 01:01:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH 09/14] scripts/qapi: add QAPISchemaIfCond.rsgen()
Date: Wed,  1 Oct 2025 10:00:46 +0200
Message-ID: <20251001080051.1043944-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001075005.1041833-1-pbonzini@redhat.com>
References: <20251001075005.1041833-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tyOnssA0vzL28c_ti_64gxPNSirj2djEYmbN844IWa8_1759305676
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Generate Rust #[cfg(...)] guards from QAPI 'if' conditions.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Link: https://lore.kernel.org/r/20210907121943.3498701-15-marcandre.lureau@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/qapi/common.py | 16 ++++++++++++++++
 scripts/qapi/schema.py |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index d7c8aa3365c..f16b9568bb9 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -199,6 +199,22 @@ def guardend(name: str) -> str:
                  name=c_fname(name).upper())
 
 
+def rsgen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]]) -> str:
+
+    def cfg(ifcond: Union[str, Dict[str, Any]]) -> str:
+        if isinstance(ifcond, str):
+            return ifcond
+        if isinstance(ifcond, list):
+            return ', '.join([cfg(c) for c in ifcond])
+        oper, operands = next(iter(ifcond.items()))
+        operands = cfg(operands)
+        return f'{oper}({operands})'
+
+    if not ifcond:
+        return ''
+    return '#[cfg(%s)]' % cfg(ifcond)
+
+
 def gen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]],
                cond_fmt: str, not_fmt: str,
                all_operator: str, any_operator: str) -> str:
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 8d88b40de2e..848a7401251 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -37,6 +37,7 @@
     docgen_ifcond,
     gen_endif,
     gen_if,
+    rsgen_ifcond,
 )
 from .error import QAPIError, QAPISemError, QAPISourceError
 from .expr import check_exprs
@@ -63,6 +64,9 @@ def gen_endif(self) -> str:
     def docgen(self) -> str:
         return docgen_ifcond(self.ifcond)
 
+    def rsgen(self) -> str:
+        return rsgen_ifcond(self.ifcond)
+
     def is_present(self) -> bool:
         return bool(self.ifcond)
 
-- 
2.51.0


