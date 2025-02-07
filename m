Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgLQO-0007pK-Di
	for mharc-qemu-rust@gnu.org; Fri, 07 Feb 2025 05:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgLQL-0007ft-To
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 05:17:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgLQK-0004Lk-BD
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 05:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738923443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2zMrreiA6fXml/tyoB0xwdzip2po3nTWUJjLq04bCbM=;
 b=JAslADjnb3+I1kn8uuAH/VR6Em85cW/mNiUXg4GrCtXfrg0o6wNlDhUZPK1NTaZRfAr+dc
 RCXcFtrmXki8+cws4VBMs+8dRMvWojXkXgfvJpNbnC4Ylr8izTQ+cf6BsaPkW/xweAQ3O6
 w9B7/NwV17gxViutyZsGlinZYuHl+rI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-TzICg8njMvGrknpPSNYb_A-1; Fri, 07 Feb 2025 05:17:22 -0500
X-MC-Unique: TzICg8njMvGrknpPSNYb_A-1
X-Mimecast-MFC-AGG-ID: TzICg8njMvGrknpPSNYb_A
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ab397fff5a3so213415166b.1
 for <qemu-rust@nongnu.org>; Fri, 07 Feb 2025 02:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738923441; x=1739528241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2zMrreiA6fXml/tyoB0xwdzip2po3nTWUJjLq04bCbM=;
 b=eHHc+uOCVkbdwpgTTuUzpNdOuXfNy3T9xW6BaENStNm2NPofeQQPsLdnzJ48l6Od5P
 k8l2piegCGGSNACfRlhwvdRWghD8kLaUxxDX4bC58U7K8Ewt3spGc24xoVOUseZNCUkq
 hFifpJl1WH1H6fS7Rkgqe74VAAUztJzA93y3oxSW5aBHKPnHzg+FM6Wuj3S1+iJuR1nT
 3dczFsfCamQULg7w4gzh+69hKayxFOFesa2K3LpQdlWO2HjJOQjdEubCxhhO5J6TtHIV
 /pPXu7txWlHXnQbM8cQxBUaUks0IjW/dlJM2M8B6MdDBLYuJn84sCzTNTx83VAxQoS45
 wBxQ==
X-Gm-Message-State: AOJu0YzEJjIxZjXKJbetptpX6ypLhMCNofKBjOYfAWXResD+SKPSWbPK
 brOPFmgEnh5zq0qwe/JDzQRYR7b3FRcbX3QrDAxSP1+1RycVjKaMUN0lVmOrV3OLHI9S7qdBr9T
 LRX35FBRuZk9uQoqa8il0p1intQ+fdVhUs508gVjexjZFOF+zuIA=
X-Gm-Gg: ASbGnctWoIbr2Q0H5B3nwmKCbnV+I5UVzGjy52To+lssuDcWncw5NfWqjo0h1OCUOpG
 /qoAWwkdLKCprDPVErSJM4PVJ92AbdOjv9N65dchrj73TIjd5QtlBWI2pW6POTZgVzq0T/+MGP8
 LpmnWDha+gwUqZmistbYsi5du7EwuKHyTZCQexTXo44LWOk0CFf7U9nfZO1NlLjs7mystsNr+LC
 iKVYMfqz0bh9guRz1KN2wbWxKiOe0kPTK3dk9OFhg2Vus3UidmxjL1goxSclGKxi/SFsyLUmiAk
 iiPWBg==
X-Received: by 2002:a17:907:6d0e:b0:ab6:cdc2:3417 with SMTP id
 a640c23a62f3a-ab76e8cef13mr685456566b.15.1738923440976; 
 Fri, 07 Feb 2025 02:17:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6CjID0RSFN1ybO48T/D2riX1cvSrYvRckWhyBsi/kD+UvPszJG/T/VWvUl46MIRHbYT/twA==
X-Received: by 2002:a17:907:6d0e:b0:ab6:cdc2:3417 with SMTP id
 a640c23a62f3a-ab76e8cef13mr685452266b.15.1738923440500; 
 Fri, 07 Feb 2025 02:17:20 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab78405313dsm146061166b.55.2025.02.07.02.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 02:17:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 10/12] rust: irq: define ObjectType for IRQState
Date: Fri,  7 Feb 2025 11:16:21 +0100
Message-ID: <20250207101623.2443552-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207101623.2443552-1-pbonzini@redhat.com>
References: <20250207101623.2443552-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jj6cS2zEFxz8ER2bqCgnnhyP9sXEx7DGmxV1ULnLDtk_1738923441
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
X-List-Received-Date: Fri, 07 Feb 2025 10:17:26 -0000

This is a small preparation in order to use an Owned<IRQState> for the argument
to sysbus_connect_irq.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/irq.rs | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/rust/qemu-api/src/irq.rs b/rust/qemu-api/src/irq.rs
index 638545c3a64..835b027d5e5 100644
--- a/rust/qemu-api/src/irq.rs
+++ b/rust/qemu-api/src/irq.rs
@@ -5,11 +5,12 @@
 //! Bindings for interrupt sources
 
 use core::ptr;
-use std::{marker::PhantomData, os::raw::c_int};
+use std::{ffi::CStr, marker::PhantomData, os::raw::c_int};
 
 use crate::{
-    bindings::{qemu_set_irq, IRQState},
+    bindings::{self, qemu_set_irq},
     prelude::*,
+    qom::ObjectClass,
 };
 
 /// Interrupt sources are used by devices to pass changes to a value (typically
@@ -21,7 +22,8 @@
 /// method sends a `true` value to the sink.  If the guest has to see a
 /// different polarity, that change is performed by the board between the
 /// device and the interrupt controller.
-///
+pub type IRQState = bindings::IRQState;
+
 /// Interrupts are implemented as a pointer to the interrupt "sink", which has
 /// type [`IRQState`].  A device exposes its source as a QOM link property using
 /// a function such as [`SysBusDeviceMethods::init_irq`], and
@@ -91,3 +93,10 @@ fn default() -> Self {
         }
     }
 }
+
+unsafe impl ObjectType for IRQState {
+    type Class = ObjectClass;
+    const TYPE_NAME: &'static CStr =
+        unsafe { CStr::from_bytes_with_nul_unchecked(bindings::TYPE_IRQ) };
+}
+qom_isa!(IRQState: Object);
-- 
2.48.1


