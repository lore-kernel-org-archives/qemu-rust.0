Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tkIbT-0005Mj-7s
	for mharc-qemu-rust@gnu.org; Tue, 18 Feb 2025 03:05:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tkIbQ-0005Lp-Er
 for qemu-rust@nongnu.org; Tue, 18 Feb 2025 03:05:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tkIbI-0007ir-9r
 for qemu-rust@nongnu.org; Tue, 18 Feb 2025 03:05:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739865902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s4rLBdVPxb6okN9/rSullSB3rdps64ovo3v4at/34SA=;
 b=Krg4oioSe73j2nCQpG/pfBWPrw19BCaaDDgw/Iz+aUIMbM1crTTyOBAp+saYRAcTwtaOdC
 RUQLEyN3nWLi+9IrCs6fV5pm1thTHoA6JUShUQ0ldDcyGuA1ir18Xt9CrUrIlDsvmOOVuC
 iJMDxkC0fn0j+te4/NgNlcuzttff3ec=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-sPZkfbRoN5aeLwj-nOevYQ-1; Tue, 18 Feb 2025 03:05:00 -0500
X-MC-Unique: sPZkfbRoN5aeLwj-nOevYQ-1
X-Mimecast-MFC-AGG-ID: sPZkfbRoN5aeLwj-nOevYQ_1739865899
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38f2cefb154so3289294f8f.0
 for <qemu-rust@nongnu.org>; Tue, 18 Feb 2025 00:04:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739865897; x=1740470697;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s4rLBdVPxb6okN9/rSullSB3rdps64ovo3v4at/34SA=;
 b=VztboWU4mRBuMDFUuxpHi2h5peCwQwneXZ1cg+LigeFN7+/uL432wl6iLalr7TxTJ3
 goordCN8HiUFah7fP7KD6TpOc1ohsE7hR4y7fyT4zskusPcN6LKRoSlA8QsV2FQ2m/j0
 QGOg/78+HPuh7q+BkFKVWgV7fgAYN/iCrXbqxR3m21BOCKH4lg8suvalrDYQdYG9ov34
 brynFETj8h6iPLqYlERzgJZTMvAv8+cufT5KDmitT1wddh+YOh+qX8Atcjc8/UEleN7V
 sqPZbNQfClbvytLd8uS5pZ3a4rArX6j4CMXmiK/eZnQZe+RYqHjFBq97VItTzvBM2HQ9
 iUZg==
X-Gm-Message-State: AOJu0YxnAcBROvl6BzLhXqHxL0k9u2pHJ5jmJduuZP9h7PlVTA1w6OF/
 Foyy8tO5HSFeZDRnBRz8YUoZM0pegT/GXSLwLcpezZxl/5v4u0FRLTLKQqbubAB2H5+pP1m8c7d
 PIgWQqIyVQrwH+rNY63M3GY69uz5FBWrHrUM/wmUMscz3HoXQ8nSIRkdu/xAjcQ==
X-Gm-Gg: ASbGncuajWuQrOyO67k6pUT4fDZrA8Nk8RvX3AffLLIKWcOMaLDuIhJMLyRDteewVvG
 1uWjEpXhxaaWJxlIeJmxE9gjB9Cxb48wiY7/6k7dTPJiYTJVefICxXuchbp/ZvTkIo97WWjeiTk
 U5z5jWN0AjypipomlAJ1Y7t6EGmdVkCJLdmbvs/z2DtxRoerpitqfBj9Am+vjmPhvVMLpAsT4TG
 nNhgVMzESXA6GRIXzL+m+wtjoVv3e24qjk0ymh6stY5WBIP8N2B23y5pkajJ83xZCDFHIt5vgLP
 jn4JOPbrl+Q=
X-Received: by 2002:a5d:64ad:0:b0:38d:d299:709f with SMTP id
 ffacd0b85a97d-38f33f4e5e9mr14705151f8f.48.1739865897345; 
 Tue, 18 Feb 2025 00:04:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGe6X0H6FoeTpeWkmvS3CDb8HxLFBW0GhixymOR6QnLXgHcuLqgZFzlSwrJSZ301QHTWUMSlw==
X-Received: by 2002:a5d:64ad:0:b0:38d:d299:709f with SMTP id
 ffacd0b85a97d-38f33f4e5e9mr14705105f8f.48.1739865896939; 
 Tue, 18 Feb 2025 00:04:56 -0800 (PST)
Received: from [192.168.10.48] ([176.206.122.109])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258dcc50sm14521234f8f.34.2025.02.18.00.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 00:04:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH] docs: rust: update description of crates
Date: Tue, 18 Feb 2025 09:04:55 +0100
Message-ID: <20250218080455.426383-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mfDgfMSU0JazjTYNWKVA-7w9UauDeMN5fEX4967hzrk_1739865899
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
X-List-Received-Date: Tue, 18 Feb 2025 08:05:12 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index 7964e1fd327..e3f9e16aacb 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -139,16 +139,22 @@ anymore.
 Writing Rust code in QEMU
 -------------------------
 
-Right now QEMU includes three crates:
+Right now QEMU includes four crates:
 
 * ``qemu_api`` for bindings to C code and useful functionality
 
 * ``qemu_api_macros`` defines several procedural macros that are useful when
   writing C code
 
-* ``pl011`` (under ``rust/hw/char/pl011``) is the sample device that is being
-  used to further develop ``qemu_api`` and ``qemu_api_macros``.  It is a functional
-  replacement for the ``hw/char/pl011.c`` file.
+* ``pl011`` (under ``rust/hw/char/pl011``) and ``hpet`` (under ``rust/hw/timer/hpet``)
+  are sample device that demonstrate ``qemu_api`` and ``qemu_api_macros``, and are
+  used to further develop them.  These two crates are functional\ [#issues]_ replacements
+  for the ``hw/char/pl011.c`` and ``hw/timer/hpet.c`` files.
+
+.. [#issues] The ``pl011`` crate is synchronized with ``hw/char/pl011.c``
+   as of commit 02b1f7f61928.  The ``hpet`` crate is synchronized as of
+   commit f32352ff9e.  Both are lacking tracing functionality; ``hpet``
+   is also lacking support for migration.
 
 This section explains how to work with them.
 
-- 
2.48.1


