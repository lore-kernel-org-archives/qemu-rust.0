Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2342AD185EF
	for <qemu-rust@archiver.kernel.org>; Thu,  8 Jan 2026 13:12:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vdpnO-0007fX-Ee; Thu, 08 Jan 2026 08:11:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpnN-0007fE-Mb
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:11:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpnM-00082W-AH
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767877879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kzld2q5RlJkN3vtzdl66CcPbGlXEZCEofO8swei4zsY=;
 b=EbCov5bbWCvwgecxmyskj//25KDlNZiyzkDrwtB69MvIqcasClxKYzvPGa22bCba10o8Am
 40GUUW+NIgzPRnfhL7Fgo1w0+woRQzYo+uGvPkqEHWhfQwfUaH12/Uc++kQdtvZkhQfFqe
 8wR+vySLHKGSjLS3WFpux+jM1wc6AfY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-d6f7yeS2Ma2rq7cjDd6hiA-1; Thu, 08 Jan 2026 08:11:18 -0500
X-MC-Unique: d6f7yeS2Ma2rq7cjDd6hiA-1
X-Mimecast-MFC-AGG-ID: d6f7yeS2Ma2rq7cjDd6hiA_1767877877
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-47d17fff653so15026245e9.0
 for <qemu-rust@nongnu.org>; Thu, 08 Jan 2026 05:11:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767877877; x=1768482677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kzld2q5RlJkN3vtzdl66CcPbGlXEZCEofO8swei4zsY=;
 b=jF60hvJnPxfGovF9AShD8CN7Kl5aHcgCCA67aMYMNDSPLhKhm948JzgrVhIJ74tKZA
 EDza9fcGyktuZpCr6rSvmQ3fZMECQgzSumVCtuwQzb0DNdG61cJysW81LXuxddD8hQEr
 HN6QoPQaMw+va68iXeyHWLXFljzme+SANQSkrX2YSIL8/xFttsoa1XaWIbM9fDKcPQyT
 96o6ybyJ3WZIx/8VcHP5n+QoX/u6AScuEv+IJk9XKEi+N+uSL7Xau6J2KlBNcp/pGa5+
 gnLIkMF9nujV8R+F7h+R58aRF4YLai1mUSTpcvSGeVs+RsncBdu8MBfgcS1xgOdKTnPg
 qHYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu4HZO0fIC63PDH9+uzHtaeqhzV1YrrJOgmQtLU0VT72zUgA6JeUZmO0saBR5t3b1qqScLKRH0BT8=@nongnu.org
X-Gm-Message-State: AOJu0YzrwAGOBnmi7Uk3L7+86SHMigKWBxQsfnCglTuV6Xj/DFJ6EfPu
 sS80NgkhAMeHLOi5OrSutnHVn2cGo0A4pKvc1HhHfflAWj2xHrde2DxJu1T7d06MzWvWNRp5aM6
 aAb0iGs+LXlKEseCoLSpsZsp4D52zQG4sxqAMSTUzGFJ+RbW5ESsndOA=
X-Gm-Gg: AY/fxX5ct5MDC+kMP1XRE1vWnMpVSSISgg8U2sTR+xuduU72ubEsP27uEAaQCj8Q7zv
 TwQNLYjbsqCjrX2v/AN8WdkdLnPaiFgYhsLMRydh2P76B4ipdqKWosp9e2zGzyt4ft2wTvyTAW1
 +sUVoPZK2sh4NCSKHgU8qJF/SRR27yyezu/pJcjNB0PQETcaUyzJ38eCnDi05cAVjLml0rT+5HQ
 FwbgzUWc6pHJuVla6pjGz8R3dAvo/WxTIVksWcPzyxydfADUCyyIc7Pb5tidxwiZK5bfUvmD9ck
 xDa7eYN2HtRHcsJZ7EKnIYOPk8rge0mvkqWlmomU/hfZ71zqmJ7QFrBuxtwmKv4j99hUz0fouLi
 gSvSQPBvV3QsGqixfRo/bwrucnqpgSA/9lsS65AtK2LN359EQiVYKgfSCaFl4XJh29hjpbZrV0t
 x3TtoIqs25yJusoA==
X-Received: by 2002:a05:600c:4e13:b0:47d:25ac:3a94 with SMTP id
 5b1f17b1804b1-47d84b32f30mr79824935e9.17.1767877876967; 
 Thu, 08 Jan 2026 05:11:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHb/egjF3zBUGVDoYK29auPfPeGuQmD2Zgs5XazD5fX4zjGL6AyDI72+ZkzZ1E03v51m+S4kA==
X-Received: by 2002:a05:600c:4e13:b0:47d:25ac:3a94 with SMTP id
 5b1f17b1804b1-47d84b32f30mr79824625e9.17.1767877876629; 
 Thu, 08 Jan 2026 05:11:16 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f69e802sm155710765e9.8.2026.01.08.05.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 05:11:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-rust@nongnu.org
Subject: [PATCH v2 11/16] scripts/qapi: pull c_name from camel_to_upper to
 caller
Date: Thu,  8 Jan 2026 14:10:38 +0100
Message-ID: <20260108131043.490084-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108131043.490084-1-pbonzini@redhat.com>
References: <20260108131043.490084-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T0KNQ97EloxbDv_Q0aWlFhXPChlOsox1at5rVwtSfH8_1767877877
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Allow using it for other languages too.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/qapi/common.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 14d5dd259c4..c75396a01b5 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -61,7 +61,7 @@ def camel_to_upper(value: str) -> str:
         ret += ch
         upc = ch.isupper()
 
-    return c_name(ret.upper()).lstrip('_')
+    return ret.upper()
 
 
 def c_enum_const(type_name: str,
@@ -75,7 +75,7 @@ def c_enum_const(type_name: str,
     :param prefix: Optional, prefix that overrides the type_name.
     """
     if prefix is None:
-        prefix = camel_to_upper(type_name)
+        prefix = c_name(camel_to_upper(type_name)).lstrip('_')
     return prefix + '_' + c_name(const_name, False).upper()
 
 
-- 
2.52.0


