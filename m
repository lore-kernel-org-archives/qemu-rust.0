Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tKd1N-0003tH-Cg
	for mharc-qemu-rust@gnu.org; Mon, 09 Dec 2024 07:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd11-0003kP-Sl
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:37:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd0x-0007Nr-7I
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:37:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733747845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EK+6NhPLRnfB+w3ii90rEiEDD8OWs1ZakSYY9qmOsvM=;
 b=MALzPmBA9vqWvBYz9LvM+GKhhScOB960OKwyVd/WMrBGzzudV/fEVLftwSxan4ouvPw4TO
 VXAHNGRsLYkA94PZosaJFS7yqMNtlIJrh/T6BfFMre4Fw0ZrTckUrl8QxNdRZwPPETiPX/
 ckstK5zcUyWoguuVdoxrGtqYyZ/XTTM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-g12_Y09lOamk3QPKICLBFw-1; Mon, 09 Dec 2024 07:37:23 -0500
X-MC-Unique: g12_Y09lOamk3QPKICLBFw-1
X-Mimecast-MFC-AGG-ID: g12_Y09lOamk3QPKICLBFw
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-434f7ec1407so5572475e9.1
 for <qemu-rust@nongnu.org>; Mon, 09 Dec 2024 04:37:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733747842; x=1734352642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EK+6NhPLRnfB+w3ii90rEiEDD8OWs1ZakSYY9qmOsvM=;
 b=IUsaupg5mHii0wCXN9RcmLgohLoR0qGj33jmNLh1WO5IvjULlmGbWXN/D5uVpm81Hp
 xGk363x5uqOH3ftYVcmoglVgW7lKkwH6vuG5gDswVik0UJpKLvOgoB5/3Mvf18dcwgIZ
 qbCla6Fb1WHo9Tjcg8n6CkHguc5rPyuL8Bgjj9gxZy5OZ4v2DbRnkEKpysWnHcvUpMJB
 UDDMp6u/DP3OWWT/9+7it4Y/d89MqbxpCKebV0gA3WUUa6nLy30CqaJJJjBjPjHi8moj
 1UsRet9RUjn9lanayEyUIKzEsZxTfaYXDW5lOtwS8I29/0No+Vad6fYBSaKc/h2aEWj7
 FUYw==
X-Gm-Message-State: AOJu0Yx2EWbu6WCCP/7e3sg4Z34q8Bi9+Tdddb4dtQXlI6jtb83Qf2Hd
 rklyQT6Koh7ssRHre6h2hNIKB6d/qZPHduTzGFGQ2lfN7yFzYIlptSppj+E8CiL4nYkxzGkl6pg
 tNI98WWVmxytnrNGLq8z642QMgw3FzixNEW+8YJwlS2xv0nT3PDA=
X-Gm-Gg: ASbGncuBIsVSmuwrKw0G4rhypV6NdmPr58WJm4ezuv/OUfajEVSrk3GcTFF1ZUqqHPx
 dg+CXX7VhR5C957kfbOzIaPx6H+UTcXc12sDRneHLsyvASjrpq7ir+Ngs4sutiOVQUB3iO4kq3D
 SLjgX9i7zlVefemRShuPkpkZ7K/OajPncP1EWVYcLEK4tMMy2NHUD4y7zyfZ6hou9mVee3vHbMZ
 cZM0+5MIgYCOl53lkJDYt6TxkPuB3jW1iPsHzv2J21iW3KOO2MLnw==
X-Received: by 2002:a05:600c:4e8a:b0:434:ffd7:6fca with SMTP id
 5b1f17b1804b1-434fff36e7cmr2877495e9.2.1733747842521; 
 Mon, 09 Dec 2024 04:37:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8GPC6tM8BP4oyS2XcKjZs8CdR5KwXF8EBpX963R9c5kDlndkEeVFU1H/170eovy4nBhnt/A==
X-Received: by 2002:a05:600c:4e8a:b0:434:ffd7:6fca with SMTP id
 5b1f17b1804b1-434fff36e7cmr2877225e9.2.1733747842143; 
 Mon, 09 Dec 2024 04:37:22 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434f08b9eebsm74725945e9.10.2024.12.09.04.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 04:37:21 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Junjie Mao <junjie.mao@hotmail.com>
Subject: [PATCH 01/26] bql: check that the BQL is not dropped within marked
 sections
Date: Mon,  9 Dec 2024 13:36:52 +0100
Message-ID: <20241209123717.99077-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209123717.99077-1-pbonzini@redhat.com>
References: <20241209123717.99077-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rp-iDIOZSDNAzqSJumJzPxlQqpO3U8pL62uqdAM4hDA_1733747843
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.489,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 09 Dec 2024 12:37:36 -0000

The Big QEMU Lock (BQL) is used to provide interior mutability to Rust
code.  While BqlCell performs indivisible accesses, an equivalent of
RefCell will allow the borrower to hold to the interior content for a
long time.  If the BQL is dropped, another thread could come and mutate
the data from C code (Rust code would panic on borrow_mut() instead).
In order to prevent this, add a new BQL primitive that can mark
BQL-atomic sections and aborts if the BQL is dropped within them.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/main-loop.h | 15 +++++++++++++++
 stubs/iothread-lock.c    | 15 +++++++++++++++
 system/cpus.c            | 15 +++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 5764db157c9..646306c272f 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -262,6 +262,21 @@ AioContext *iohandler_get_aio_context(void);
  */
 bool bql_locked(void);
 
+/**
+ * bql_block: Allow/deny releasing the BQL
+ *
+ * The Big QEMU Lock (BQL) is used to provide interior mutability to
+ * Rust code, but this only works if other threads cannot run while
+ * the Rust code has an active borrow.  This is because C code in
+ * other threads could come in and mutate data under the Rust code's
+ * feet.
+ *
+ * @increase: Whether to increase or decrease the blocking counter.
+ *            Releasing the BQL while the counter is nonzero triggers
+ *            an assertion failure.
+ */
+void bql_block_unlock(bool increase);
+
 /**
  * qemu_in_main_thread: return whether it's possible to safely access
  * the global state of the block layer.
diff --git a/stubs/iothread-lock.c b/stubs/iothread-lock.c
index d7890e5581c..54676598950 100644
--- a/stubs/iothread-lock.c
+++ b/stubs/iothread-lock.c
@@ -1,6 +1,8 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 
+static uint32_t bql_unlock_blocked;
+
 bool bql_locked(void)
 {
     return false;
@@ -12,4 +14,17 @@ void bql_lock_impl(const char *file, int line)
 
 void bql_unlock(void)
 {
+    assert(!bql_unlock_blocked);
+}
+
+void bql_block_unlock(bool increase)
+{
+    uint32_t new_value;
+
+    assert(bql_locked());
+
+    /* check for overflow! */
+    new_value = bql_unlock_blocked + increase - !increase;
+    assert((new_value > bql_unlock_blocked) == increase);
+    bql_unlock_blocked = new_value;
 }
diff --git a/system/cpus.c b/system/cpus.c
index 1c818ff6828..ba633c7688b 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -514,6 +514,20 @@ bool qemu_in_vcpu_thread(void)
 
 QEMU_DEFINE_STATIC_CO_TLS(bool, bql_locked)
 
+static uint32_t bql_unlock_blocked;
+
+void bql_block_unlock(bool increase)
+{
+    uint32_t new_value;
+
+    assert(bql_locked());
+
+    /* check for overflow! */
+    new_value = bql_unlock_blocked + increase - !increase;
+    assert((new_value > bql_unlock_blocked) == increase);
+    bql_unlock_blocked = new_value;
+}
+
 bool bql_locked(void)
 {
     return get_bql_locked();
@@ -540,6 +554,7 @@ void bql_lock_impl(const char *file, int line)
 void bql_unlock(void)
 {
     g_assert(bql_locked());
+    g_assert(!bql_unlock_blocked);
     set_bql_locked(false);
     qemu_mutex_unlock(&bql);
 }
-- 
2.47.1


