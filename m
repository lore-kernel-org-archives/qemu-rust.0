Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgLQQ-0007xK-0x
	for mharc-qemu-rust@gnu.org; Fri, 07 Feb 2025 05:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgLQC-0007cZ-9s
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 05:17:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgLQA-0004Jq-Ak
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 05:17:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738923433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TjaNShE0GYpF6KF1Wxl7XEXpF6pZfvD+oUSQf7rKQdY=;
 b=KST70znHFO0eWz5LTz3AwwNw68p0rj4zjir6qe+crMuO/f0tPJHcdlO7Wp0CenA2GXBUgM
 0DBIO7CoMKohpRSLOHuNH/z5fTXZGwRbDVqmeKupmHm1b5grJ5ZUEr1pVtgxO5vwgJYOLi
 WOV6TpSGL75AP5fSgBbqf7cz9fnx7Gg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-s0-RFCsnPGW4qwUL-h4waA-1; Fri, 07 Feb 2025 05:17:11 -0500
X-MC-Unique: s0-RFCsnPGW4qwUL-h4waA-1
X-Mimecast-MFC-AGG-ID: s0-RFCsnPGW4qwUL-h4waA
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ab78f08e32cso42689266b.2
 for <qemu-rust@nongnu.org>; Fri, 07 Feb 2025 02:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738923430; x=1739528230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TjaNShE0GYpF6KF1Wxl7XEXpF6pZfvD+oUSQf7rKQdY=;
 b=gdAxGdcvKwA4JswHhBtvBVFEktuOE65PwoI3lnVWl4u8zODDSaiDhyu8ZVdPFN5o0/
 nrjY1/MrhF14gYG2HcqwnbqILEAOE5HeYVFgcghHVQlDGDMJZnVRAZyYJr1nqRQoOo7Z
 TlVJX0cEXEfHp9YnFBiz5smhMAtIyZ9p399m9c3CHElLTanuNmKTcTPlS0IARiQ87ZdS
 9Gs/xrrK/le/fIdP7ETfokv9uuNWdlHYtiI3MNxC+Si6GqeR1c6MFSjnW00Ij3Z2+h1z
 evaBAvZNbLD44El1AEIv7ABNttPVmYpkHPPglq0lDXskrAqM8kjpRVb0ctcAdSF6PV37
 t6jA==
X-Gm-Message-State: AOJu0YxnKnIiJry15nkR8LV3Eq82Z2WNz0lMpowILAZft29Up/IQtqwb
 o5KCfWmsFthq2Ih8GJk3VN4I+GZcPqix5nNpY7HJrzkVl+FRzRpDk/2/T1T7PR2N1fGmcBH4+7V
 2wK0ny74fLa1s/Ntm61EGm1AGYE25rHTlEIAj1ftN63fEL3zJuBA=
X-Gm-Gg: ASbGncsLMQePj/9fAjG7+XSO9tHn+avhBW5RRcNUWogEvddYiOAojoCwme9v6scsuyD
 Mnx/dsE/T7SnJcRamFUqa7HBoM8qKmZZpmI/WreD+g7GG54kmsyG48mvYRqkAQ+CUNl6Fve8AqT
 fcO99ZbBGzrbFz0C8wag0VZdxJUmj3r6mqqmRZmiBxng2iD3yMPcWGATHPJYQzlIsUve4lzouhp
 /NYFL2HJhxmNJVX20iCYfL6sNFK5uII8M6Cj2ecFfWomiOpCqmZLVfaajURcT2oFpNDWwJNlplq
 cAkpLQ==
X-Received: by 2002:a05:6402:2106:b0:5dc:8fb1:d44d with SMTP id
 4fb4d7f45d1cf-5de450e21aamr2777318a12.31.1738923430048; 
 Fri, 07 Feb 2025 02:17:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYp/qCQKGqc9ALJGnFfpCzNDn5MW+i6Srj0+xOB+dOTx67uTb5tDI5ArxPFQFyZaPjizB/GA==
X-Received: by 2002:a05:6402:2106:b0:5dc:8fb1:d44d with SMTP id
 4fb4d7f45d1cf-5de450e21aamr2777286a12.31.1738923429553; 
 Fri, 07 Feb 2025 02:17:09 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf1b739f8sm2283300a12.6.2025.02.07.02.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 02:17:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 08/12] rust: bindings: add Send and Sync markers for types
 that have bindings
Date: Fri,  7 Feb 2025 11:16:19 +0100
Message-ID: <20250207101623.2443552-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207101623.2443552-1-pbonzini@redhat.com>
References: <20250207101623.2443552-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ydq0aFRLeiCZpprMb0mEWN9E4kHmbW024dZpKqmI8_8_1738923430
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Fri, 07 Feb 2025 10:17:22 -0000

This is needed for the MemoryRegionOps<T> to be declared as static;
Rust requires static elements to be Sync.

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/bindings.rs | 46 +++++++++++++++++++++++++++++++++++
 rust/qemu-api/src/irq.rs      |  3 +++
 2 files changed, 49 insertions(+)

diff --git a/rust/qemu-api/src/bindings.rs b/rust/qemu-api/src/bindings.rs
index 8a9b821bb91..b71220113ef 100644
--- a/rust/qemu-api/src/bindings.rs
+++ b/rust/qemu-api/src/bindings.rs
@@ -21,9 +21,55 @@
 #[cfg(not(MESON))]
 include!(concat!(env!("OUT_DIR"), "/bindings.inc.rs"));
 
+// SAFETY: these are implemented in C; the bindings need to assert that the
+// BQL is taken, either directly or via `BqlCell` and `BqlRefCell`.
+unsafe impl Send for BusState {}
+unsafe impl Sync for BusState {}
+
+unsafe impl Send for CharBackend {}
+unsafe impl Sync for CharBackend {}
+
+unsafe impl Send for Chardev {}
+unsafe impl Sync for Chardev {}
+
+unsafe impl Send for Clock {}
+unsafe impl Sync for Clock {}
+
+unsafe impl Send for DeviceState {}
+unsafe impl Sync for DeviceState {}
+
+unsafe impl Send for MemoryRegion {}
+unsafe impl Sync for MemoryRegion {}
+
+unsafe impl Send for ObjectClass {}
+unsafe impl Sync for ObjectClass {}
+
+unsafe impl Send for Object {}
+unsafe impl Sync for Object {}
+
+unsafe impl Send for SysBusDevice {}
+unsafe impl Sync for SysBusDevice {}
+
+// SAFETY: this is a pure data struct
+unsafe impl Send for CoalescedMemoryRange {}
+unsafe impl Sync for CoalescedMemoryRange {}
+
+// SAFETY: these are constants and vtables; the Send and Sync requirements
+// are deferred to the unsafe callbacks that they contain
+unsafe impl Send for MemoryRegionOps {}
+unsafe impl Sync for MemoryRegionOps {}
+
 unsafe impl Send for Property {}
 unsafe impl Sync for Property {}
+
+unsafe impl Send for TypeInfo {}
 unsafe impl Sync for TypeInfo {}
+
+unsafe impl Send for VMStateDescription {}
 unsafe impl Sync for VMStateDescription {}
+
+unsafe impl Send for VMStateField {}
 unsafe impl Sync for VMStateField {}
+
+unsafe impl Send for VMStateInfo {}
 unsafe impl Sync for VMStateInfo {}
diff --git a/rust/qemu-api/src/irq.rs b/rust/qemu-api/src/irq.rs
index 378e5202951..638545c3a64 100644
--- a/rust/qemu-api/src/irq.rs
+++ b/rust/qemu-api/src/irq.rs
@@ -43,6 +43,9 @@ pub struct InterruptSource<T = bool>
     _marker: PhantomData<T>,
 }
 
+// SAFETY: the implementation asserts via `BqlCell` that the BQL is taken
+unsafe impl<T> Sync for InterruptSource<T> where c_int: From<T> {}
+
 impl InterruptSource<bool> {
     /// Send a low (`false`) value to the interrupt sink.
     pub fn lower(&self) {
-- 
2.48.1


