Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tlWS0-0008Ud-Cw
	for mharc-qemu-rust@gnu.org; Fri, 21 Feb 2025 12:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRv-000880-9m
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:04:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRt-0001XG-JP
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740157464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gITORNAi3idPJ7f7HHnX56O6J1H0hwCpHvwebA0yrfA=;
 b=En5IzO81dJ3vi042USSJ0sxqbHUNly8tCOHs78Fk129YP+oHy23BdVvthrgqZBZox7wI4g
 SuiEzM7kl3A1viPhmgqL6DSg2IP4wd3AyC/elyGgs3KF0Oap3+cJ/x6sYEGN/oVmh3+ERE
 Tx6+wwzYeMrfNQM9siEJyU9pUHFjo0U=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-pNrhUXNVPtuMju6YlpHMbw-1; Fri, 21 Feb 2025 12:04:23 -0500
X-MC-Unique: pNrhUXNVPtuMju6YlpHMbw-1
X-Mimecast-MFC-AGG-ID: pNrhUXNVPtuMju6YlpHMbw_1740157462
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-abb7e837a7aso65914666b.3
 for <qemu-rust@nongnu.org>; Fri, 21 Feb 2025 09:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740157462; x=1740762262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gITORNAi3idPJ7f7HHnX56O6J1H0hwCpHvwebA0yrfA=;
 b=mU48Wm3NocGFvL7mnkXE6Gt1Q4LB0W4nWtt0wVFGHKqRx9PCrsUhyoKlI23+Imy9ZI
 W5uVee6WIRB3641mK4p/hyQNOn0hDEBBIEhpn25XBJvjcZZbMCRLQkWawZ1DwgUbayRH
 NGkB6AlCX1mViSmdNDofAx4gjgze4OK8k7eJLpKlESISmHFiF4Cs3mgdKizr6d+xWLIh
 tOGQ2Zvts9vFzilCABHvQqhIiD7E94uuEDU9T3rcKSadFe0l1g48spA4ktO+2yyX5T7R
 oe4MTd5hQNGR5m7CpRXoyCUVUhduPwLLp0E+4u5ue4QjKJ39S9Z5Z2B5Vu4DUkyFbs3u
 TIPA==
X-Gm-Message-State: AOJu0YyFf2IR21KXmaHSObp00E9bYkjKp+niNWZpVIuDaA1iiJQD8e5+
 +ZXQTEvCq98GG3y3IDxch0IVq5k1gib7vbHNJGejCfnX1cH3EeMzS/EB5ju7xduC36f4MRtOVeW
 KdPFZuNBudi8X8SF4WS/S8fEdV+tPS0VBUlFFfK2LuqiceyGRpzg=
X-Gm-Gg: ASbGncu73wD0uqrYqVt7t74pBdK5LeIEY5ds/5AU4YED6roWaQx1+lcAsyZuffQjd/0
 27VQXRw9JSSGmhgfedHidIUsL5DAYZ32t+yCMv4MLMQIKXW3WCtBtdY0LgxDfb7L5bA2sYj/cAa
 XhmIkqTGB9ATYsqBPsq/X7CvTjDHq5fczX3pndThv7CCib/jL61FnoTtt3NZCKAIVOy/L+50yfh
 GMrvVvosIxcqo+RW235wRbhg8Qw+cGL6EDufvtbXTrrLcEAFY5RvV0VjL52A5fR6ZbRkkwDOQMT
 qEvEqxhgm5FXqFi1ZQg=
X-Received: by 2002:a17:907:d204:b0:ab9:63bd:91be with SMTP id
 a640c23a62f3a-abc099b3911mr472628266b.3.1740157462198; 
 Fri, 21 Feb 2025 09:04:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh3OiPvtScaPUKA6oR2syBGUS8aeCMOzQAoTZ6jAjPhsuT4a36zKEOsBZELst31y+ZScBTgg==
X-Received: by 2002:a17:907:d204:b0:ab9:63bd:91be with SMTP id
 a640c23a62f3a-abc099b3911mr472617766b.3.1740157461568; 
 Fri, 21 Feb 2025 09:04:21 -0800 (PST)
Received: from [192.168.10.48] ([151.95.61.185])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbda707e3dsm535043666b.106.2025.02.21.09.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 09:04:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 14/15] rust: chardev: wrap Chardev with Opaque<>
Date: Fri, 21 Feb 2025 18:03:41 +0100
Message-ID: <20250221170342.63591-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221170342.63591-1-pbonzini@redhat.com>
References: <20250221170342.63591-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M2PXEQKEiHi7klufE4R7aTMw25I08dxw6jW4uIBEZic_1740157462
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.424,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 21 Feb 2025 17:04:27 -0000

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
index ed5dce08216..1ff6c1ca7c2 100644
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


