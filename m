Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYsCs-0001dN-E8
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 14:40:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYsCq-0001c3-Jj
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 14:40:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYsCo-0002Dq-Em
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 14:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737142830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QsBnnC+UEglMSUQPR072ZGcFxRcTecgJCzaWCd7nUBI=;
 b=GFKHyaEAu2SLhuh5T4fnBdvpXSDLcrUxEp18VglaRAAme39+NOtVzjSRpbV1qMNkQIBIlY
 gLaAd4MSCPXLPqTPp6njRNWA6PFELXBDhOpBMfrEQuosSqksBpzl7sdcxEpFn/hv6gRbNy
 aQ2AbXTNzBUyqccaYQsMJKnjLpGwTus=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-_qNe8woLMKKyeYVHPfO2pg-1; Fri, 17 Jan 2025 14:40:29 -0500
X-MC-Unique: _qNe8woLMKKyeYVHPfO2pg-1
X-Mimecast-MFC-AGG-ID: _qNe8woLMKKyeYVHPfO2pg
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ab397fff5a3so83421266b.1
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 11:40:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737142827; x=1737747627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QsBnnC+UEglMSUQPR072ZGcFxRcTecgJCzaWCd7nUBI=;
 b=soe9thJOYHKtpvpwtJ3JuBSFqxfrc/0ZlCha+QVwqr5LTFd86G63ebS15j2cJOx6PM
 uGVZuWT4Qe2RIhDXOm6vPLeWs+zJpqcRVYX714SPCuLjLD1hX2T4l3aXLKYf5kApwjcA
 EcVYfRu1lncu2AdjKpb1SFy/2ecUOPMr8K7daeJetxPPOE0MOdGNwiWN9p2SmCbjcDQC
 zVFJH1cU2870UuX8K7sh4JoFoxln+O48G4/rG5/IEfqyH06CiLto3ZPUFx8YWvHKl02t
 BSeSpDZARzJoMqKZ3J7xMeOTq+8KNxYHcY5Wfjj9QZ/CHVsnWiwiD3BXxWu2Zv/rxct1
 mhwg==
X-Gm-Message-State: AOJu0YxkipqT6L39SHtjF6Up/7Kn8EjCHXnrYJ4e9N/SQ5S/sK8w9N30
 u3wdy/huwXUXT/uiKjsKmLqaw4rW/9vrmNJBcGAHp6aWr8FSFkziVAmuWObzfaxFuUrzf+DxX1O
 a86JDouq1CfWg/1D6rTv5d643IIj0X7GzA+Ji8pRSm5wIdaqYRhMA9mVxbyI1qg==
X-Gm-Gg: ASbGncs11NjEoAbogUbA0sFft6BBkF5n4DktZTj12Dq7iAtM1gt4Cr6ZQbTMTK9z++l
 m6DKlnEjaDSn9Frf60RNC1xTMqxdUE7oC/rz90sGLt7oKqTvgoAJ1q/bIcGq99RrraVPK400D8S
 iBnd17k/qcfDy5SqSyY02/R/52nXhgXE7uDadT5+Vg0syarUdbkjZZZdUzWsiHfwFKI44RaCrvT
 MfHefvBwYjJY4b4XYZf6tywnXwdTf7gXRrw5J1rbI6vN2vmimLBEQNe5wPj8g==
X-Received: by 2002:a17:906:99c2:b0:ab2:faed:fad5 with SMTP id
 a640c23a62f3a-ab38cc8f4afmr295070666b.15.1737142827008; 
 Fri, 17 Jan 2025 11:40:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxdrZHqpDe6C9QrkUsgwubTEYk4OqEheVEYW7WoWLeoplqUR4CKOTcrdanHRbuMe6isWiOGg==
X-Received: by 2002:a17:906:99c2:b0:ab2:faed:fad5 with SMTP id
 a640c23a62f3a-ab38cc8f4afmr295069966b.15.1737142826671; 
 Fri, 17 Jan 2025 11:40:26 -0800 (PST)
Received: from [192.168.10.47] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384c57034sm218647366b.34.2025.01.17.11.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 11:40:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 09/10] rust: bindings: add Sync markers to types referred to
 by MemoryRegionOps
Date: Fri, 17 Jan 2025 20:40:02 +0100
Message-ID: <20250117194003.1173231-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117194003.1173231-1-pbonzini@redhat.com>
References: <20250117194003.1173231-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PfVnIqXV51f1v_19QsmKudBDQSTO__b1NAufKzgbtwc_1737142828
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.79,
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
X-List-Received-Date: Fri, 17 Jan 2025 19:40:36 -0000

This is needed for the MemoryRegionOps<T> to be declared as static;
Rust requires static elements to be Sync.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/bindings.rs | 19 ++++++++++++++++++-
 rust/qemu-api/src/irq.rs      |  3 +++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/rust/qemu-api/src/bindings.rs b/rust/qemu-api/src/bindings.rs
index 8a9b821bb91..3f61264ab80 100644
--- a/rust/qemu-api/src/bindings.rs
+++ b/rust/qemu-api/src/bindings.rs
@@ -21,7 +21,24 @@
 #[cfg(not(MESON))]
 include!(concat!(env!("OUT_DIR"), "/bindings.inc.rs"));
 
-unsafe impl Send for Property {}
+// SAFETY: these are implemented in C; the bindings need to assert that the
+// BQL is taken, either directly or via `BqlCell` and `BqlRefCell`.
+unsafe impl Sync for BusState {}
+unsafe impl Sync for CharBackend {}
+unsafe impl Sync for Chardev {}
+unsafe impl Sync for Clock {}
+unsafe impl Sync for DeviceState {}
+unsafe impl Sync for MemoryRegion {}
+unsafe impl Sync for ObjectClass {}
+unsafe impl Sync for Object {}
+unsafe impl Sync for SysBusDevice {}
+
+// SAFETY: this is a pure data struct
+unsafe impl Sync for CoalescedMemoryRange {}
+
+// SAFETY: these are constants and vtables; the Sync requirements are deferred
+// to the unsafe callbacks that they contain
+unsafe impl Sync for MemoryRegionOps {}
 unsafe impl Sync for Property {}
 unsafe impl Sync for TypeInfo {}
 unsafe impl Sync for VMStateDescription {}
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
2.47.1


