Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tnenB-0005eh-2M
	for mharc-qemu-rust@gnu.org; Thu, 27 Feb 2025 09:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnemo-000462-8Q
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnemm-00049b-9p
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740666167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vQFYgL5OvkIroXqJVu4wnMdYvtwWSlXNwP+wGqmQy7o=;
 b=I85cCRXYtfF8k9jGdLDl4H2Y8m3EOGKfH0eSLuKvBZUR3mh51lWhOwJ8v4Ko7mGrw4ehgT
 5urmBkKTRPGb0EzFLqkNQBfcBFJYCBK8r0LEHkuu7IKIxsfutd0sHdjUtgKiGTWMgnPTZa
 mGs1KETZisp1dqtTaOpTaf1Ho9zeCTg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-LO1LNFA3MFG7Yb7-6Apo6w-1; Thu, 27 Feb 2025 09:22:46 -0500
X-MC-Unique: LO1LNFA3MFG7Yb7-6Apo6w-1
X-Mimecast-MFC-AGG-ID: LO1LNFA3MFG7Yb7-6Apo6w_1740666165
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-abba896add9so116919066b.1
 for <qemu-rust@nongnu.org>; Thu, 27 Feb 2025 06:22:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740666165; x=1741270965;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vQFYgL5OvkIroXqJVu4wnMdYvtwWSlXNwP+wGqmQy7o=;
 b=W/f2eg4/OiIPppP21TjMv9Qh3UD4QJnIzo0Kbs/10TQRhhq9povJ3XdrCX/s7PzmtF
 /MRU6Vnh7jKui2R6dFm+VdmL49d6btNu11g23mFYkX7fiTx9S8eCKvlJ4m8PglKO6sim
 dg9ufr1VbiKeiRzhYtOu6eG1XHH12sJ5GZ+iXhO0Iui6CNCOBIWQCSHQxSujojLpKZMn
 lI+qknUu3ZJKz/mWl3uy5TRC9u3dJzXx0LbXZ9Mo8uRrVF7QmmAY1rz7Oo21n2t3eXuV
 KirFEJ771kBDdEReGqWqNlL3v9w7VFPBkel+6RRHuI78dCS3zzEXyrWpxi6GDssk96ea
 vJ/w==
X-Gm-Message-State: AOJu0YxMHoNakRQ+6I+7ofV801whxHGLmf1ejOOMiRbTpC00r9YjctkQ
 qs+THUwVjAtQQJsuDHj2FKcuyT6Xher6WNJe0tl/s3UF7fhuiuLgvArPqsheyogAv0CXiCO0SmU
 UQv5A7RuTaXhliu6c8xI/LOqXQnm+MZ6fC+fYiZU3R5qZhtXvrHQ=
X-Gm-Gg: ASbGncsl5jALw7aGqnmsLzUpJqcO8pr1FzuuP6hy2Sp2CElVrjRCHAI52H3wPLp40eO
 Bhpo7oG1Lbko69Lhz2K4jH4/eF+p1Qw8Z6nudr6Ig2kDhvWy6aVpxAJ7UeFc5701plwTT36cjIR
 q7SBAcXNgqpeEkS3CYdkIVtPKte/9GBMsp7hLWcY1f5ZOBAwHcDwWfXIPkgSQFO8TzliX3zwUt5
 YKwl6KQtQeTDv/WU5sdkdDYQmNdU6rI2wY8cwKVpgSwCF/0twPR6NCVixLzbjkmeIdkdOkEYIns
 Y7fQxWTwQFMVOdz2Q5Dd
X-Received: by 2002:a17:906:b818:b0:abc:29e3:f453 with SMTP id
 a640c23a62f3a-abc29e3f7cdmr2333890666b.33.1740666164947; 
 Thu, 27 Feb 2025 06:22:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCow23dBkk3rFhCa7lI/9dK6hjQRPITll/EpbdyAGB2nPmQzKCR6XsdnnEYg4+TFph+esQ9g==
X-Received: by 2002:a17:906:b818:b0:abc:29e3:f453 with SMTP id
 a640c23a62f3a-abc29e3f7cdmr2333887966b.33.1740666164574; 
 Thu, 27 Feb 2025 06:22:44 -0800 (PST)
Received: from [192.168.10.48] ([176.206.102.52])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c74c714sm129332066b.124.2025.02.27.06.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 06:22:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 11/12] rust: chardev: wrap Chardev with Opaque<>
Date: Thu, 27 Feb 2025 15:22:18 +0100
Message-ID: <20250227142219.812270-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227142219.812270-1-pbonzini@redhat.com>
References: <20250227142219.812270-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eBzL_hU9jkaP1BtkynLhn6ZAtsk59zERkTCzLIov2Bg_1740666165
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-List-Received-Date: Thu, 27 Feb 2025 14:22:51 -0000

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/bindings.rs | 3 ---
 rust/qemu-api/src/chardev.rs  | 8 ++++++--
 rust/qemu-api/src/qdev.rs     | 1 +
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/rust/qemu-api/src/bindings.rs b/rust/qemu-api/src/bindings.rs
index 26cc8de0cf2..c3f36108bd5 100644
--- a/rust/qemu-api/src/bindings.rs
+++ b/rust/qemu-api/src/bindings.rs
@@ -31,9 +31,6 @@ unsafe impl Sync for BusState {}
 unsafe impl Send for CharBackend {}
 unsafe impl Sync for CharBackend {}
 
-unsafe impl Send for Chardev {}
-unsafe impl Sync for Chardev {}
-
 unsafe impl Send for ObjectClass {}
 unsafe impl Sync for ObjectClass {}
 
diff --git a/rust/qemu-api/src/chardev.rs b/rust/qemu-api/src/chardev.rs
index 74cfb634e5f..a35b9217e90 100644
--- a/rust/qemu-api/src/chardev.rs
+++ b/rust/qemu-api/src/chardev.rs
@@ -6,9 +6,13 @@
 
 use std::ffi::CStr;
 
-use crate::{bindings, prelude::*};
+use crate::{bindings, cell::Opaque, prelude::*};
+
+/// A safe wrapper around [`bindings::Chardev`].
+#[repr(transparent)]
+#[derive(qemu_api_macros::Wrapper)]
+pub struct Chardev(Opaque<bindings::Chardev>);
 
-pub type Chardev = bindings::Chardev;
 pub type ChardevClass = bindings::ChardevClass;
 
 unsafe impl ObjectType for Chardev {
diff --git a/rust/qemu-api/src/qdev.rs b/rust/qemu-api/src/qdev.rs
index 1c4a67b5728..18b4a9ba687 100644
--- a/rust/qemu-api/src/qdev.rs
+++ b/rust/qemu-api/src/qdev.rs
@@ -334,6 +334,7 @@ fn init_clock_out(&self, name: &str) -> Owned<Clock> {
     fn prop_set_chr(&self, propname: &str, chr: &Owned<Chardev>) {
         assert!(bql_locked());
         let c_propname = CString::new(propname).unwrap();
+        let chr: &Chardev = chr;
         unsafe {
             bindings::qdev_prop_set_chr(
                 self.upcast().as_mut_ptr(),
-- 
2.48.1


