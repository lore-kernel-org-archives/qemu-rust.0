Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623EECCA476
	for <qemu-rust@archiver.kernel.org>; Fri, 10 Oct 2025 15:17:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v7EmD-0000Wq-Or; Fri, 10 Oct 2025 11:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7EmC-0000TQ-8a
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 11:11:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7Ele-0004Ar-9A
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 11:11:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760109045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hJgKnO4p5NCBfsiH7X9uVt6uTBPOKNgBfFsL5Wo3g90=;
 b=P7vcDPwSNpu05Pjdok2nxsi8MvmUXsfLoJ7L56Avr340JBpMUvOT3I7IcHkvzxvn7/Jn5u
 coUSapY+ujEVwQW9DhgNYpZ6KKiPrVYiy+WJ+X3OHUyOAOSHXXnu8EERaNvCLtv8aBmzkJ
 mFVDH28JY1FFkjtGgzRue7YNXTlMcuw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-j8kqszksMQm--nel8kDi7g-1; Fri, 10 Oct 2025 11:10:42 -0400
X-MC-Unique: j8kqszksMQm--nel8kDi7g-1
X-Mimecast-MFC-AGG-ID: j8kqszksMQm--nel8kDi7g_1760109042
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-b47cf7544e0so217079266b.1
 for <qemu-rust@nongnu.org>; Fri, 10 Oct 2025 08:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760109041; x=1760713841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hJgKnO4p5NCBfsiH7X9uVt6uTBPOKNgBfFsL5Wo3g90=;
 b=egLh5Ut3QTS3c5nXH2B6I6FIckymBO5ec7t35nL+jspekOBVHmY5JdJddOtkS8jnrH
 lJmQHgnqgRC0izgVtJ5P+eBw1TuT7TzTVKuGvMjG4tGb1WtXgADHQpVsfBWzxz8EKKHS
 Aoy4lBb8Dnt1m5ToAQfnmmRZkIRAO3becTAJdTiEEkU5XkRNON6T2QQkFseukZl1+Zn6
 QwwKgYFaBcII1B5i6zkPueb5CX8NCbr3SrrOk6d3xSL1+ivpouSYbLduuR9K7SNzcFb8
 7nTqz2YhRAD1eG4UHpojaA8/Shd3De8w35NWu+LbKP1LQ14ok8bmAdqyE+d326FLD7+4
 q2cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvkhJSAPajzX/7P0yQrLe9l7RcmrljKVtr0DCyWjC2sJO3bA/sbpYHYoN3k2PS5hIIn5aoDyIWQvM=@nongnu.org
X-Gm-Message-State: AOJu0YztrOnpSM4x+Zh++k5mVp+bXAxpPlG70kL3go49zNT6NDBxiurl
 MgYU8vRBEhmtPuwYMbHbtsG2YQjauUG34KpmKQLvbm6JKnrk4VrKhKDBO2DAB8wqIPTHSsXrjMH
 yION4RxsIQR6XfCwyUQzAPHGWIhVt8YTxIJuLri01fF0hotMLOuHONA8=
X-Gm-Gg: ASbGnctGyMbw1Z/aJCVWSmy/Iva6sJYEonE2t3qgahW3Hz1M+AhHeKmlDDqZvukCxKr
 cxi2/bfqBnJCkBsZHlVp+RJxL58JSCnbn+4YT1yxvdKujF5ILWNgQffS9HrqHuElvi/K74FyC6z
 FdMuc8yIVbT5vIi1bneFxaSD7/RH6Jg0FCPhbtwVAW8FXbeeTUIsGeGtiDciFsz+SLIYcVS55Iz
 fKMZTv5JEh44vU03Rl9kBep0JF32hj4bpy4y/FP83RXJmbaCf9O6dzeOKUGoQUGlIvZ1jv4WdJy
 Gbl4AKP+x3hgnQG53GPLC5/XjIOTMqh1bHjouj5sp5PBvIF6P+OZnDxM80tFTQ1b7f/WKtUGsQ3
 lSTl8M+DkbWbEtC6kOmHavaT1pbsNNedvCjsmBDwYSZGz
X-Received: by 2002:a17:906:4788:b0:b0c:fdb7:4df5 with SMTP id
 a640c23a62f3a-b50aa08f7f4mr1389338866b.18.1760109041425; 
 Fri, 10 Oct 2025 08:10:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE491ow71Xn+kTdRFhbgU/RYKqRUnCR6cj5ICQnAJbi9K9r4MnXO8OtjBc2PBq3vRKmHl1bIg==
X-Received: by 2002:a17:906:4788:b0:b0c:fdb7:4df5 with SMTP id
 a640c23a62f3a-b50aa08f7f4mr1389335966b.18.1760109040950; 
 Fri, 10 Oct 2025 08:10:40 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.231.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d8c12a08sm256553266b.52.2025.10.10.08.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 08:10:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	marcandre.lureau@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 13/19] scripts/qapi: add QAPISchemaIfCond.rsgen()
Date: Fri, 10 Oct 2025 17:09:58 +0200
Message-ID: <20251010151006.791038-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010151006.791038-1-pbonzini@redhat.com>
References: <20251010151006.791038-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QJZS6huErLPNvotNtxLyXxZ-_SlHwRBhwiDnJC_SNlU_1760109042
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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


