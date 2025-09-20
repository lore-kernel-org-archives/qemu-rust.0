Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2B2CAC5A7
	for <qemu-rust@archiver.kernel.org>; Sat, 20 Sep 2025 14:30:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uzybK-0007F2-VT; Sat, 20 Sep 2025 10:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uzybJ-0007ER-AK
 for qemu-rust@nongnu.org; Sat, 20 Sep 2025 10:30:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uzybG-0005Q7-UD
 for qemu-rust@nongnu.org; Sat, 20 Sep 2025 10:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758378606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJ3YNFEPq2/8msLkXx1NZ4U+hOxlX3VeLMqMSz14QdI=;
 b=FPVLb4XOra8CRTFtgsypwhz/W1jWxQlF6SJDK/di7nfMYJS5pfm7nRZe/NDp1Nrtv2L893
 6n5Tm4ywE3Q4eT6NBVm9GIsZWax6asJFER3ynMFXt82q6JypYvjb1I24Q3V7dQcH+DWhHd
 0TbSiAuij4d/rkMu2UlyAhmHonws1qM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-GmGZuh4iP1CVIlTLIWov1Q-1; Sat, 20 Sep 2025 10:30:04 -0400
X-MC-Unique: GmGZuh4iP1CVIlTLIWov1Q-1
X-Mimecast-MFC-AGG-ID: GmGZuh4iP1CVIlTLIWov1Q_1758378604
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45f2f1a650dso18575685e9.2
 for <qemu-rust@nongnu.org>; Sat, 20 Sep 2025 07:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758378603; x=1758983403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fJ3YNFEPq2/8msLkXx1NZ4U+hOxlX3VeLMqMSz14QdI=;
 b=O7wfi0Pnif3ZCk4MovW/i2oN4NAp2Td4f8uG1dGnODMbek1VU6l2tH7GkfztnNleJu
 eGNCPzCMBfIqZi4Q/yZq6tE4z1DLaj9/i++wPcHbMY7qRZavBB0H/jJQhviM+9IWZuGZ
 tA7obVdFbxjwiQupNLgaeT26c+Mz0NfoNsHh+nSH2qhxCHdl7uGzX8eOaIvB22Prfmqs
 dVbM2KhucAXLXGQ09UYggFd3zFlu7gc1em0p+0SnDZ9FoRhKYw1Wvt7YzgR+aHGynQFf
 r5dsKO4y1oBPWhfWJyp3zbcQTSuEjJkH+jJff6NNeiqT/swjko/l6bPcda8i4MgEP7IW
 uQFA==
X-Gm-Message-State: AOJu0Ywl+TzwHJSL5YDokz6uCeOqBhGoLRF1CAHGsxm2IAf1vzrtrz9l
 hefVp7hzs+U+NZskoGjfJ9GSsXAM7GFPb/cSMFFGg7v3PJi3F2r8jWgvL41s96XylqXKFft9u89
 nQqpTWNc1SvKJG8IYfgI1u+R3EscUUifz0Z8ulPCB+zQG3QcUUApb3Hm/f3gFFm0=
X-Gm-Gg: ASbGncv/Gf7SuMaZ9BPqO0dLXfR+nbyS/SUdBEkIJN9PYRZpl5A25DzsJygNUrnLVVj
 oqxWfBMDlbqXE4GUv+LPmdpJ8nSoBi7gwmV3ekEBOjVepRcDFM001m+NzMybw35aEEg9YQeg88w
 pbmwvAkULULzoiCbJqhZLYweWuBBpcuezBwRKAufz15GQIw3wgWixOLd/qNu+0IP+5GDSJjbwsc
 6Eg5MdccFlVH9CHiLFxFWpUlZKn/rc/S9ObtRAzuuVnfwzjJP9mO7x3OdPF1X/7ttoP7aycY8Bf
 APK2pObkDVZ3bLcjNcZPbnNfqPZt1EfjG//HcqiEAQ42FSyjkqz2UNKr3S1ffIjiBeo/5tVStNf
 P+RlaHQ8Q4ggy9mcUV2STCupOCP9wjcbMEU5IBFUVwgM=
X-Received: by 2002:a05:600c:1d91:b0:468:11af:782b with SMTP id
 5b1f17b1804b1-46811af793emr56247775e9.29.1758378603265; 
 Sat, 20 Sep 2025 07:30:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/qk76o0RmehkijCLaE4imfHrVhxw+6WVQ5uZMGzREY2hhrdZoKipoZrfdr7YlRVt3B9wLmA==
X-Received: by 2002:a05:600c:1d91:b0:468:11af:782b with SMTP id
 5b1f17b1804b1-46811af793emr56247585e9.29.1758378602834; 
 Sat, 20 Sep 2025 07:30:02 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.47.123])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f32136cdasm99628655e9.4.2025.09.20.07.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 07:30:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, zhao1.liu@intel.com, manos.pitsidianakis@linaro.org
Subject: [PATCH 1/7] rust: bql: add BqlRefCell::get_mut()
Date: Sat, 20 Sep 2025 16:29:52 +0200
Message-ID: <20250920142958.181910-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920142958.181910-1-pbonzini@redhat.com>
References: <20250920142958.181910-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NiK_G4G-7p-fXzYU6wAsy82vuNTz6HbnJPkJGs6mRsU_1758378604
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.045,
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

This method is rarely useful in QEMU due to the pervasiveness of
shared references, but add it for when a &mut BqlRefCell<> is used.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/bql/src/cell.rs | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/rust/bql/src/cell.rs b/rust/bql/src/cell.rs
index 24ab294b60d..8a0c8c14ad4 100644
--- a/rust/bql/src/cell.rs
+++ b/rust/bql/src/cell.rs
@@ -580,6 +580,25 @@ pub fn borrow_mut(&self) -> BqlRefMut<'_, T> {
         }
     }
 
+    /// Returns a mutable reference to the underlying data in this cell,
+    /// while the owner already has a mutable reference to the cell.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use bql::BqlRefCell;
+    ///
+    /// let mut c = BqlRefCell::new(5);
+    ///
+    /// *c.get_mut() = 10;
+    /// ```
+    #[inline]
+    pub const fn get_mut(&mut self) -> &mut T {
+        // SAFETY: there cannot be any outstanding borrow,
+        // since `self` is mutably owned.
+        unsafe { &mut *self.as_ptr() }
+    }
+
     /// Returns a raw pointer to the underlying data in this cell.
     ///
     /// # Examples
-- 
2.51.0


