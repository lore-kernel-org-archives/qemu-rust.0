Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tlWRQ-0006ju-2Q
	for mharc-qemu-rust@gnu.org; Fri, 21 Feb 2025 12:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRO-0006eA-It
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:03:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRM-0001OG-1H
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:03:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740157431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0g4/7JXprhjHS9Kq/Ky0pszdlpKOhaBkh9IAViO+mbo=;
 b=VbZ+M9TVyWAonecDS06ddYwg8LQIGqU1bw3784J12RHo2g0Tsll6P+tweDjnN9g47wh9gu
 YEsxMb9rEIAH8jITBdCihnUGlhYAgOGOQ6cgsfqKvHxyfN6EBjlsgQZjPuQkTk6/+1dTL9
 Kccc5getVdROH/2vfp3D5GYaV+RQAoE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-r-wUTSg0P2il23M68Jwmng-1; Fri, 21 Feb 2025 12:03:48 -0500
X-MC-Unique: r-wUTSg0P2il23M68Jwmng-1
X-Mimecast-MFC-AGG-ID: r-wUTSg0P2il23M68Jwmng_1740157426
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43998ec3733so12161835e9.2
 for <qemu-rust@nongnu.org>; Fri, 21 Feb 2025 09:03:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740157426; x=1740762226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0g4/7JXprhjHS9Kq/Ky0pszdlpKOhaBkh9IAViO+mbo=;
 b=Dt9w2k4DGMCzhXLUEtBTioyVff7tIlTrsjLz1djFWUNDMHbbgJXCPzV/CtJeaHqutY
 A8xqKnFrw6kJmb1MFLSmLUBHYuZXRAsfimAvboQmB4wEloO/cy30HwaYHzd83MF2qBnG
 bsO9+qJozZvWi7lonn9XfNxkSbsG/abSQl4MFyo8QX3iDdI/FNYCmUSlaBol6/KixCbu
 2gAs9mjBeAmJ2GVfD0moPUsey9YDd+9pxgtzLn0e+5+6K1tWKdX+gUHt70y/v5OUHRLO
 GfvbzkF5GRd0Mz/wi1w0ln8CUu52StiGip/TmZ9uVRXVYo2e1qAOIhqZk7OFM2wUnB4Z
 VoxQ==
X-Gm-Message-State: AOJu0Yx240L+re6Kt4GW8ht5qCckQ3HClBChhxEdlLpqEMKStIblwN3m
 cCyVnttHK9sSvDExFPrKb+OUCNNUuktWnq5Ky4HmjREISlRf90PBTCSgJ/FIhl4cr3dT4sQ0u6H
 RgQ0D0LNqovkrJ/Y9xkQ1bY/hNmZZ6DDkXSwJ0+qXhcCCR4mRIL8=
X-Gm-Gg: ASbGnctDRpDYj/tLH0IHCvAyRbcTdfIZeWr9zjgFtzP4izHsTT/sLEGYm1QXA6KhnfC
 CXgARybVnovbaB0H2a8BMmTHPYvwwJBQW3xqvHCZ8ej2ZpdEkgqbpK7iXDYQaGhQ2J6gZj5UM3z
 vkt+HfaZcPf+Q1uwMrOx1wGCazzMR7mR6fmxzdExovoVgR29/RxtCzw9mmixb0tkrFQozXJTsPC
 j2Ph/jf095ewhaUu/yIkUUA1NrTHwVj51e2BVsHjM5NsMZUEJe2X/BhU0LMNs3n7bV2NowxMN5F
 FH4ldc7U0I0WIg2P72A=
X-Received: by 2002:a05:600c:4ecc:b0:439:84d3:f7ee with SMTP id
 5b1f17b1804b1-439ae2189bemr27774605e9.24.1740157425802; 
 Fri, 21 Feb 2025 09:03:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtZV5PSFgZqTOdAUJyQQTcqb6e++ndjRbyVA7u2lzRkwjkjWYbB7b6ugUaJc4QQsNIsJE8pg==
X-Received: by 2002:a05:600c:4ecc:b0:439:84d3:f7ee with SMTP id
 5b1f17b1804b1-439ae2189bemr27773765e9.24.1740157424715; 
 Fri, 21 Feb 2025 09:03:44 -0800 (PST)
Received: from [192.168.10.48] ([151.95.61.185])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b0371b7bsm23277985e9.33.2025.02.21.09.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 09:03:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 01/15] rust: add IsA bounds to QOM implementation traits
Date: Fri, 21 Feb 2025 18:03:28 +0100
Message-ID: <20250221170342.63591-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221170342.63591-1-pbonzini@redhat.com>
References: <20250221170342.63591-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MN_XCWNFo0uUPeBt7WuQ6BB0NCt9sC8CrhEwoDEOBE8_1740157426
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.424,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-List-Received-Date: Fri, 21 Feb 2025 17:03:54 -0000

Check that the right bounds are provided to the qom_isa! macro
whenever the class is defined to implement a certain class.
This removes the need to add IsA<> bounds together with the
*Impl trait bounds.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/qdev.rs | 2 +-
 rust/qemu-api/src/qom.rs  | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/qemu-api/src/qdev.rs b/rust/qemu-api/src/qdev.rs
index 3a7aa4def62..c4dd26b582c 100644
--- a/rust/qemu-api/src/qdev.rs
+++ b/rust/qemu-api/src/qdev.rs
@@ -86,7 +86,7 @@ pub trait ResettablePhasesImpl {
 }
 
 /// Trait providing the contents of [`DeviceClass`].
-pub trait DeviceImpl: ObjectImpl + ResettablePhasesImpl {
+pub trait DeviceImpl: ObjectImpl + ResettablePhasesImpl + IsA<DeviceState> {
     /// _Realization_ is the second stage of device creation. It contains
     /// all operations that depend on device properties and can fail (note:
     /// this is not yet supported for Rust devices).
diff --git a/rust/qemu-api/src/qom.rs b/rust/qemu-api/src/qom.rs
index 3d5ab2d9018..10ce359becb 100644
--- a/rust/qemu-api/src/qom.rs
+++ b/rust/qemu-api/src/qom.rs
@@ -37,6 +37,8 @@
 //! * a trait for virtual method implementations, for example `DeviceImpl`.
 //!   Child classes implement this trait to provide their own behavior for
 //!   virtual methods. The trait's methods take `&self` to access instance data.
+//!   The traits have the appropriate specialization of `IsA<>` as a supertrait,
+//!   for example `IsA<DeviceState>` for `DeviceImpl`.
 //!
 //! * an implementation of [`ClassInitImpl`], for example
 //!   `ClassInitImpl<DeviceClass>`. This fills the vtable in the class struct;
@@ -497,7 +499,7 @@ impl<T: ObjectType> ObjectDeref for &mut T {}
 impl<T: ObjectType> ObjectCastMut for &mut T {}
 
 /// Trait a type must implement to be registered with QEMU.
-pub trait ObjectImpl: ObjectType + ClassInitImpl<Self::Class> {
+pub trait ObjectImpl: ObjectType + ClassInitImpl<Self::Class> + IsA<Object> {
     /// The parent of the type.  This should match the first field of the
     /// struct that implements `ObjectImpl`, minus the `ParentField<_>` wrapper.
     type ParentType: ObjectType;
-- 
2.48.1


