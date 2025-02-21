Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tlWS2-0000Fv-Fy
	for mharc-qemu-rust@gnu.org; Fri, 21 Feb 2025 12:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRx-0008Hp-RT
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:04:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRw-0001Y9-4Q
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:04:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740157467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hGeedFex4hwcA+4WKc4T7rcitnlGc1D0mCRSihvSmdw=;
 b=JoSp4giLr/OaB+ejSpOZshloHdKIu6iav5+vyHVGNjhhn1u4ufqz2BDgRCniAXfximJYW4
 uoKIBHiKYeXHgHMcgZO0E5jhX3KCdYiaLx+5Fj1Nfz0TLwTxUDnGyTKcKAMrMSTVx6pjiB
 aRLjQIFiLn1tjFHglNKS7mYGYEiRlUw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-h1BBpudZMKafjXmRmaNKSg-1; Fri, 21 Feb 2025 12:04:25 -0500
X-MC-Unique: h1BBpudZMKafjXmRmaNKSg-1
X-Mimecast-MFC-AGG-ID: h1BBpudZMKafjXmRmaNKSg_1740157465
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-abb76bd0feeso223860066b.0
 for <qemu-rust@nongnu.org>; Fri, 21 Feb 2025 09:04:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740157464; x=1740762264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hGeedFex4hwcA+4WKc4T7rcitnlGc1D0mCRSihvSmdw=;
 b=hjzAqFpTVnTbfJ88lHprtKywNrJJLa4hzb5B4NoPwbV7Ph+vgWggSCuRIDohiLhhWH
 VIHolWW44wQ/mft5fquACkunQFcvfhrtVnN7v5JfzvW5v84yIYBLzLdPSku3kyCRIiGI
 z+g+GwGSPIra6p2okhVOM7UWCHIROr49JaT6sWHPKZFZWjEYGq1zWlF/B5kIvLJnNKUp
 n+IimNUnY95Bum0S+OqKfN2BRC+d56Ygk4fhAMLu9SRCypLsVFEhlKbZusheDl8KwbIl
 GU62TsVEL2xSufhaBSwx61S4sMy1EHw1VCEgy0GbK6mPAviT/CR+TN49bLmffdBGnxcs
 3tGg==
X-Gm-Message-State: AOJu0YxPK40pomdz9KB0KZVtxIhvzrQ27zzBrZ15akCvW/kdfiiDHwcM
 2FDj58JaU8XKZIvyhjiKMgkaY6kmoK7/K7MdjJi69BFO86cFW13Ems0NVT78jVsYRAhO4jPMYoa
 yn29Y6AflBSvuIhDA3ssL33cv62X07sdn+rCj8ATTh5pkb2KO060=
X-Gm-Gg: ASbGncu1iTnAzLdHEGKjVZBoJ2CAh9XG7WsCfIXcQCZGSS/DTh5VNMRI3yrYocKmTrF
 Wl7VfF4d2aw90ql3ra65roS5lypPUjcxTSJsJnC5oBQZDp2Td5zfABRrWQ6/l494CJ7BUEX7aSe
 DK/5nrOZJHj/cLL63+giCMmsPdFwMzDSviGaUmsh3xW5KhcfSU5oJnf9TrBToxjTci7gnTUf1m1
 mXLi+CvQD+sUZkx2DmI0Dzjnq9ZbwCcA/1cseV2RD1byv8oBdGlVmyNoikR6QsbGJ7dyPpb/iRx
 IKYWlA6Q45yJDm5Nd3A=
X-Received: by 2002:a17:907:1686:b0:abb:dbc2:bfb6 with SMTP id
 a640c23a62f3a-abbedd4df55mr796077066b.10.1740157464615; 
 Fri, 21 Feb 2025 09:04:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEECFPHS+8PObVyoFvxy1YQzPxv9V7w9Vt4je3ICUJK7nFtqsY2CGp21/qsO3xZ0JJk5hx44Q==
X-Received: by 2002:a17:907:1686:b0:abb:dbc2:bfb6 with SMTP id
 a640c23a62f3a-abbedd4df55mr796070266b.10.1740157464045; 
 Fri, 21 Feb 2025 09:04:24 -0800 (PST)
Received: from [192.168.10.48] ([151.95.61.185])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba910e8b11sm1394251366b.21.2025.02.21.09.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 09:04:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 15/15] rust: bindings: remove more unnecessary Send/Sync impls
Date: Fri, 21 Feb 2025 18:03:42 +0100
Message-ID: <20250221170342.63591-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221170342.63591-1-pbonzini@redhat.com>
References: <20250221170342.63591-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HFT7v2xjWn5CceaYvZoZfFSwLEimllil0dhprIZ7wGw_1740157465
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
X-List-Received-Date: Fri, 21 Feb 2025 17:04:30 -0000

Send and Sync are now implemented on the opaque wrappers.  Remove them
from the bindings module, unless the structs are pure data containers
and/or have no C functions defined on them.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/bindings.rs | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/rust/qemu-api/src/bindings.rs b/rust/qemu-api/src/bindings.rs
index c3f36108bd5..3c1d297581e 100644
--- a/rust/qemu-api/src/bindings.rs
+++ b/rust/qemu-api/src/bindings.rs
@@ -25,15 +25,11 @@
 
 // SAFETY: these are implemented in C; the bindings need to assert that the
 // BQL is taken, either directly or via `BqlCell` and `BqlRefCell`.
-unsafe impl Send for BusState {}
-unsafe impl Sync for BusState {}
-
+// When bindings for character devices are introduced, this can be
+// moved to the Opaque<> wrapper in src/chardev.rs.
 unsafe impl Send for CharBackend {}
 unsafe impl Sync for CharBackend {}
 
-unsafe impl Send for ObjectClass {}
-unsafe impl Sync for ObjectClass {}
-
 // SAFETY: this is a pure data struct
 unsafe impl Send for CoalescedMemoryRange {}
 unsafe impl Sync for CoalescedMemoryRange {}
-- 
2.48.1


