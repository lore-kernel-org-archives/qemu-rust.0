Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tkIbV-0005NM-Gv
	for mharc-qemu-rust@gnu.org; Tue, 18 Feb 2025 03:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tkIbQ-0005Lz-SV
 for qemu-rust@nongnu.org; Tue, 18 Feb 2025 03:05:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tkIbL-0007jB-Vy
 for qemu-rust@nongnu.org; Tue, 18 Feb 2025 03:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739865904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rRHv0VAGXKvzhgsoXOj/6ynjCFigFeP4/lBHiQ/K8J0=;
 b=YLYWKMpKbfKe3PoVtqzcA/PfVCGdWnpQAWPRR0K6CUyvnWDBb6UdapRvd8UuKRSD0kWWcY
 ojEHbLvegY5gUa8LkSzIIDXPfRls7/A7nAtvh/KAEu00DK9q5wubGbik/UegZG780FAVRu
 gPnq7OauqrhgqenHc+IPtonoVg9ZLos=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-02ziF6jSNM6dU_BIAyQbFw-1; Tue, 18 Feb 2025 03:05:02 -0500
X-MC-Unique: 02ziF6jSNM6dU_BIAyQbFw-1
X-Mimecast-MFC-AGG-ID: 02ziF6jSNM6dU_BIAyQbFw_1739865901
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38f2f78aee1so2146215f8f.0
 for <qemu-rust@nongnu.org>; Tue, 18 Feb 2025 00:05:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739865900; x=1740470700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rRHv0VAGXKvzhgsoXOj/6ynjCFigFeP4/lBHiQ/K8J0=;
 b=CiFiPgPJNM5lIRwL+qN7m1+0UcKCot/qb6BjGXfk0Qt9cuVcelG4Ly0OohC+frdPyH
 hVIL8QoRyZYpou0iRkvYVvMYkvScwuEJUUP4M9DNUYztVWSAV6isAz/iNPBI/NuClbxe
 XHHFgpJYjKc5i+OX7PzRVoVwSP/K1/B/fm8uOHndAw7ae8OqMuAqSDfeOX0uG+M89WPS
 XTY7WcIbMQ9stvr9wO0pX5zp7MxNeIoK9GODZqytt+YKBbQnhbJKxtUUDLCXHDJiQC+I
 1aP5mOninUI9YT/IQIPEOkD5ePHglOFgQ//TPdfNiP8W/stopDqpWf9KOUUJ/UHWaK0c
 xVqw==
X-Gm-Message-State: AOJu0YxAMWU6buLwjHvls61vNA+AOsZVCC5+ryn84Ll1CCRiNMO8bxkK
 mFERwCPLBhv8i9Z1B4tR5WEazcRMIhhyokOtFEN9sZa6da94HadI+SvKBIrbiN/5ymzWXMELpJm
 s3/M6J4jaMc0jSYbDS7sHPKI9fm3I/W5toi1zFBccNZTh7xc4yBvSzpSnhMPbyw==
X-Gm-Gg: ASbGncuO4aXZuDRNqUttLInQoP/FVI0q+ijfplB3LPxwlpJrqWKm+5sK4Dr/WLqrHCZ
 JBR5i98tEJijBxvujYT/rmdX0xfNGb7txCMnWhaA9fgeE/3FOr+Xcw31AZQSPyH75CuUVFEcptH
 TjQy9C9w6m0kTFJljkPZ3Z23bdIEBLKt/Y+8gJWX9IynqHCMSQotXnHetnKViHaqEKBFyiU91cX
 nwY4VtW/vu6uY6xengoDdIqaFFRpKFoYFl43BpWgFt45lTSYqxZx+nClOVynmKMMXUARYYDDqQm
 r+9gVmKPPSE=
X-Received: by 2002:a05:6000:71c:b0:38f:2b64:5327 with SMTP id
 ffacd0b85a97d-38f2b6457ccmr12524034f8f.24.1739865900525; 
 Tue, 18 Feb 2025 00:05:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExdTXtJsJlWpXL8sWoHyZsgMcjfgiDRw9KCtr6MC9mkHmwCs3Q1dxFw7+DOnfgc7MecXG+gw==
X-Received: by 2002:a05:6000:71c:b0:38f:2b64:5327 with SMTP id
 ffacd0b85a97d-38f2b6457ccmr12524011f8f.24.1739865900115; 
 Tue, 18 Feb 2025 00:05:00 -0800 (PST)
Received: from [192.168.10.48] ([176.206.122.109])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b4118sm14650555f8f.18.2025.02.18.00.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 00:04:59 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH] docs: rust: fix typos
Date: Tue, 18 Feb 2025 09:04:58 +0100
Message-ID: <20250218080458.426402-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: it6813kpwFVbV-yYOBWvezdwH_Teo_EjAYboFeIMrSo_1739865901
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Tue, 18 Feb 2025 08:05:14 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index 90958e5a306..7964e1fd327 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -293,7 +293,7 @@ to a Rust mutable reference, and use a shared reference instead.  Rust code
 will then have to use QEMU's ``BqlRefCell`` and ``BqlCell`` type, which
 enforce that locking rules for the "Big QEMU Lock" are respected.  These cell
 types are also known to the ``vmstate`` crate, which is able to "look inside"
-them when building an in-memory representation of a ``struct``s layout.
+them when building an in-memory representation of a ``struct``'s layout.
 Note that the same is not true of a ``RefCell`` or ``Mutex``.
 
 In the future, similar cell types might also be provided for ``AioContext``-based
@@ -349,7 +349,7 @@ Writing procedural macros
 '''''''''''''''''''''''''
 
 By conventions, procedural macros are split in two functions, one
-returning ``Result<proc_macro2::TokenStream, MacroError>` with the body of
+returning ``Result<proc_macro2::TokenStream, MacroError>`` with the body of
 the procedural macro, and the second returning ``proc_macro::TokenStream``
 which is the actual procedural macro.  The former's name is the same as
 the latter with the ``_or_error`` suffix.  The code for the latter is more
-- 
2.48.1


