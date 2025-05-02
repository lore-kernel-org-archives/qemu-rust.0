Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAmGQ-0006oE-HH
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 05:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAmGO-0006lT-U2
 for qemu-rust@nongnu.org; Fri, 02 May 2025 05:00:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAmGN-0004yX-9e
 for qemu-rust@nongnu.org; Fri, 02 May 2025 05:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746176454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LqeniZgXmPTdrTI+xq1XQTwnSc7B7nOzlTpRU2OjaDw=;
 b=CkB1H4bwk9y2MJAWL61AYxgKnMuFHuVQgjDkR19MqhrqBT8eU+SGj08Vi5YD1HQzPHuB0h
 nfoWfS7SXuHx74BcuJ5sAptJI0UWPbH61emXM5re/mI3m8/HgWJIBg9UDyWXW1+F0DNyz2
 1xcPbhPBKQazScnf/baEFUVupu7IZ9A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-sY9_bcWaPu-zy1nlMDGb4Q-1; Fri, 02 May 2025 05:00:52 -0400
X-MC-Unique: sY9_bcWaPu-zy1nlMDGb4Q-1
X-Mimecast-MFC-AGG-ID: sY9_bcWaPu-zy1nlMDGb4Q_1746176451
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-44059976a1fso8110745e9.1
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 02:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746176451; x=1746781251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LqeniZgXmPTdrTI+xq1XQTwnSc7B7nOzlTpRU2OjaDw=;
 b=vJDMJaEzHpGLOtwctduMG5o0pSG5k9IZ7gTDFhvw3nwOu7xtb57pMLHAPkPjEDWG85
 WZLiXmuGI9yBdOIybbYOuZYKPrObBmmBZiVuL7KgjihyLnfXckEaufpkz4Qy1CXkhnEi
 BiPLSoinKDxwpK7kCYTMw9oiS3kTbEYZl+9l0tje8lmjAcyUFOEJTCrq6jZCABDA5Xl7
 LtvA+LdSixMHOrtUFL43Eu+2IWR8IguETsXpuXVTFOJ2Q2gn8uu4tPh0+mVBp+IEVBd/
 mI20CoMnTqnw26/O7KGGI1he6TVGdEvCM1fA4dbDqxRItvt2hPvPYTpMToAWXihVlPmV
 S10Q==
X-Gm-Message-State: AOJu0YzOvJyfA8I3SodCiNEepNdLNJRLRQbsW4dZUMK0L1OuJNRILOya
 4yRIZxpAECjZF2k3Ytat67gUpSzM6tT3HhEDsaspy6RU8lF6XWkjk7RI9a9lT25F03qGDr7a5Dv
 Va2LdHXo5Ww7g/o1CG0HKB+bkkBI3QNEdNjDYYpbmAjMYLRwsOCQ=
X-Gm-Gg: ASbGncv+DdXzlRrck8O6NFeg88WwkM7zBvwrgWy9AFcE1+/eyamJx1U9WQRdUHHG2As
 Ea6CotyALiIpMccvteQMIfcVqWknL01eKEpPHyFxEqp8aO3M9cR1GBfQrWGbkWwg3cyGgBgLEwP
 Gk/EEiPuTl0b3UGQUU3dbte+eZ9k97Ga/EjzxzTvKLMcRzXTH0L7rSvUsXzWpGTEU8zGzaa+0AF
 a6BrC2C7fuH+OtDgh5Tiengvbz3mszK8OVBPqBJT/p1KqYJwrVu/67+rCOf5k+LxLaJEZGLRimL
 +gWEgeSiYnKjiRk=
X-Received: by 2002:a05:600c:350e:b0:43c:e478:889 with SMTP id
 5b1f17b1804b1-441bbe2c815mr15375985e9.0.1746176450963; 
 Fri, 02 May 2025 02:00:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+tzGHivF2o1epk5esBZ6yOZ/tw87gcc3F+4KjQOedrrPJ6XNosdMscmRTR4AVNNmWzkRMKg==
X-Received: by 2002:a05:600c:350e:b0:43c:e478:889 with SMTP id
 5b1f17b1804b1-441bbe2c815mr15375545e9.0.1746176450510; 
 Fri, 02 May 2025 02:00:50 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b8a2873csm37255055e9.30.2025.05.02.02.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 02:00:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 2/2] rust: assertions: Support index field wrapped in BqlCell
Date: Fri,  2 May 2025 11:00:44 +0200
Message-ID: <20250502090044.85557-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502090044.85557-1-pbonzini@redhat.com>
References: <20250502090044.85557-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XYOQ1q5Pekc9qidnuGR0L1URcsm2O-vpyib6RMRHvAE_1746176451
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.644,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Fri, 02 May 2025 09:00:57 -0000

Currently, if the `num` field of a varray is not a numeric type, such as
being placed in a wrapper, the array variant of assert_field_type will
fail the check.

HPET currently wraps num_timers in BqlCell<>. Although BqlCell<> is not
necessary from strictly speaking, it makes sense for vmstate to respect
BqlCell.

The failure of assert_field_type is because it cannot convert BqlCell<T>
into usize for use as the index.  Use a constant 0 instead for the index,
by avoiding $(...)? and extracting the common parts of
assert_field_type! into an internal case.

Commit message based on a patch by Zhao Liu <zhao1.liu@intel.com>.

Link: https://lore.kernel.org/r/20250414144943.1112885-3-zhao1.liu@intel.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/assertions.rs | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/rust/qemu-api/src/assertions.rs b/rust/qemu-api/src/assertions.rs
index eb12e9499a7..a2d38c877df 100644
--- a/rust/qemu-api/src/assertions.rs
+++ b/rust/qemu-api/src/assertions.rs
@@ -78,33 +78,26 @@ fn types_must_be_equal<T, U>(_: T)
 /// ```
 #[macro_export]
 macro_rules! assert_field_type {
-    ($t:ty, $i:tt, $ti:ty) => {
+    (@internal $param_name:ident, $ti:ty, $t:ty, $($field:tt)*) => {
         const _: () = {
             #[allow(unused)]
-            fn assert_field_type(v: $t) {
-                fn types_must_be_equal<T, U>(_: T)
+            fn assert_field_type($param_name: &$t) {
+                fn types_must_be_equal<T, U>(_: &T)
                 where
                     T: $crate::assertions::EqType<Itself = U>,
                 {
                 }
-                types_must_be_equal::<_, $ti>(v.$i);
+                types_must_be_equal::<_, $ti>(&$($field)*);
             }
         };
     };
 
+    ($t:ty, $i:tt, $ti:ty) => {
+        $crate::assert_field_type!(@internal v, $ti, $t, v.$i);
+    };
+
     ($t:ty, $i:tt, $ti:ty, num = $num:ident) => {
-        const _: () = {
-            #[allow(unused)]
-            fn assert_field_type(v: $t) {
-                fn types_must_be_equal<T, U>(_: T)
-                where
-                    T: $crate::assertions::EqType<Itself = U>,
-                {
-                }
-                let index: usize = v.$num.try_into().unwrap();
-                types_must_be_equal::<_, &$ti>(&v.$i[index]);
-            }
-        };
+        $crate::assert_field_type!(@internal v, $ti, $t, v.$i[0]);
     };
 }
 
-- 
2.49.0


