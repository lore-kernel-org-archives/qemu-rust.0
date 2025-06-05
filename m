Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uN7ZU-00040A-Au
	for mharc-qemu-rust@gnu.org; Thu, 05 Jun 2025 06:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7ZR-0003zI-Qn
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:11:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7ZQ-0000Ux-7J
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749118295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Okeje+ixEE/+O4/VwY4A/s56SZZy0f4ZBr76iuiWX8=;
 b=BbgjoyQbFWqHdYoY76edQyUigayDYLWrlSQWONZ+QzBrmzvbkbGU9WLxVi6ybbGSWsFFmR
 4hryCY8yy4fzi101rMECGndnG7TIksvAk8CqqSErVm6oTZBW7Fsyyza6PUYEcIsi9BRXbO
 VdNJPO3DBrCZXQ9HjCYR9um81LAIZw0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-9otkaGtVMjiJruJAHGKF-Q-1; Thu, 05 Jun 2025 06:11:34 -0400
X-MC-Unique: 9otkaGtVMjiJruJAHGKF-Q-1
X-Mimecast-MFC-AGG-ID: 9otkaGtVMjiJruJAHGKF-Q_1749118293
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-442f90418b0so3713395e9.2
 for <qemu-rust@nongnu.org>; Thu, 05 Jun 2025 03:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749118292; x=1749723092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Okeje+ixEE/+O4/VwY4A/s56SZZy0f4ZBr76iuiWX8=;
 b=piurfy7F/vgexgRVuDtTCcnzPkS7YFiJozGDLw7+l/VDHJ3J5GvoGFvVwq/ScP5NsD
 uAodSzr7wZZSUV522NqhY/F6s3DleiAo/Nc2q/s3+ShSgZipMCXdVwuPPkl+hsusoHyT
 wFbBB56/cmGi9wCwOL/+8Cl2X5kGpSg2pSoGxZEq2CmVxiQPOF/yrt7hF4B5kqjYxmmF
 t+wsdZddwjxP+xvy0WUAXUyeLiZwiRRrMqT3SKZQAeJN5Jx4HZqIbtyJP3st4jspjgj9
 b6Fpg3m2AYCC7+bAY6PPuD2KufmxiS01cKtv0o/8wr56Uw3JBIIlp1JQeKGjaR7QEIra
 lR7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4Piwv90UwhG1sow7gpWzVu5V9O06Qzby1Hai/Hae84NQW3IoRPxCfMYuUjPoEf0R6V+IrV36LpQ4=@nongnu.org
X-Gm-Message-State: AOJu0Yw97XAty3wEYPBsiTKxt2YUWXtH292W2gcui0y2u/LNIAqcjLr2
 29++E482jnOJvGKmUii74m9MGePy3uUmh8yTXhkyhkbD3msQjHhfnD3YbPjvvPihc+87QUjBkVy
 aL9RmzzUS2jEth2L37ltcyHo9aewRx8+D0mVeZObIYTh11mTrGSnpJEUpj4I5eqM=
X-Gm-Gg: ASbGncs7SL2AV1fIxDqCYSQAr0cL0UKgXq+Hu6DWH6GrPwW54MZFEPnfd2y/vF+DPsj
 YmAYoJ+BpKjezRfiTfl+uemm/PWu2Kf+6+LSXlx2FEuu9cjseXUXiDwUB7PlGS83oinW0I59EHd
 Jkqw6NXNYHnrvMsxLEzv0IsxyGGuubUCDA29JmL4e31IL5BpxTPmF3mMzb5rhBR8OK45n2sVWb+
 BRkLYaa2OlpB6AaCIcu3wE5PzJyM+3oe8UcJIqPiAmo9PKKSK91RDvgA3YBXHU/t/Xm3bZOiCtk
 vO5i4Kyhkg7nlA==
X-Received: by 2002:a05:600c:1548:b0:43c:f8fc:f697 with SMTP id
 5b1f17b1804b1-451f0a72bf1mr63683025e9.9.1749118292244; 
 Thu, 05 Jun 2025 03:11:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHv4BZlg7IQTIK1NtDnwdTwqHU4dpxMBjP2efyRRoVPnkVzK7U73suZEbmV9UEg/7tm7sE9wg==
X-Received: by 2002:a05:600c:1548:b0:43c:f8fc:f697 with SMTP id
 5b1f17b1804b1-451f0a72bf1mr63682765e9.9.1749118291820; 
 Thu, 05 Jun 2025 03:11:31 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe5b962sm23785081f8f.7.2025.06.05.03.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 03:11:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, qemu-rust@nongnu.org, armbru@redhat.com,
 mkletzan@redhat.com
Subject: [PATCH 2/3] scripts/qapi: add QAPISchemaIfCond.rsgen()
Date: Thu,  5 Jun 2025 12:11:23 +0200
Message-ID: <20250605101124.367270-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605101124.367270-1-pbonzini@redhat.com>
References: <20250605101124.367270-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MNhC-6_meyHQPAyGQd0yj4v4q_vGfwfXObKagyVM_2Y_1749118293
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 05 Jun 2025 10:11:39 -0000

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
index d7c8aa3365c..a8ea5792c11 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -199,6 +199,22 @@ def guardend(name: str) -> str:
                  name=c_fname(name).upper())
 
 
+def rsgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
+
+    def cfg(ifcond: Union[str, Dict[str, Any]]):
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
index cbe3b5aa91e..0fb151b5d89 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -39,6 +39,7 @@
     docgen_ifcond,
     gen_endif,
     gen_if,
+    rsgen_ifcond,
 )
 from .error import QAPIError, QAPISemError, QAPISourceError
 from .expr import check_exprs
@@ -65,6 +66,9 @@ def gen_endif(self) -> str:
     def docgen(self) -> str:
         return docgen_ifcond(self.ifcond)
 
+    def rsgen(self) -> str:
+        return rsgen_ifcond(self.ifcond)
+
     def is_present(self) -> bool:
         return bool(self.ifcond)
 
-- 
2.49.0


