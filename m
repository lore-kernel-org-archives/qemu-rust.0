Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tvaVL-0003wg-0X
	for mharc-qemu-rust@gnu.org; Fri, 21 Mar 2025 07:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvaVG-0003uc-T4
 for qemu-rust@nongnu.org; Fri, 21 Mar 2025 07:25:31 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvaVE-0004ON-BN
 for qemu-rust@nongnu.org; Fri, 21 Mar 2025 07:25:30 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso13390085e9.1
 for <qemu-rust@nongnu.org>; Fri, 21 Mar 2025 04:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742556327; x=1743161127; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9vH8UmsTVl9pFvTYnHstPZudBd2C6Qn5erg4QfltUDw=;
 b=PgMx0PEs61XRjPmZ2ULXErS8IL9F08LY1PhBHHvaJAfksmgFE12RCD7PTzu84SMh9a
 j9LsYRIkxvKcjuhreejmM0otf+J4rjIIliIq5/1RvSMmCG35kCAwskyVWG66GANGF1V4
 eF2bisBvb7nL+VuyVF5T6WaaUTE+Q58qK88k/7aX7VmQqNmM6RNhiuUY5N1LfKZlzjTR
 AbLr/5rcG6I37CSFs8nlM7NcHbQXFfcuGMkukZ3Xvq1J2OpjoYIBK7W9NPmr2VjRvgwc
 VesnX4wyo5LnX3SiuQf8Xg7ys0Cv8ddDVbbyxmNtfaZRRHGTccRHdKyUNkUg2FDGSzhN
 +Ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742556327; x=1743161127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9vH8UmsTVl9pFvTYnHstPZudBd2C6Qn5erg4QfltUDw=;
 b=Qvg3SLI6KtAkF7MFGAJHLWkFVfhY06yu3778HfBFsty2s2bC1jP0Kft8kvrM/+/+ou
 E58KH733inzlXMygMv4P1ljaJhoGPeoIgCUUXU2HNJJ3a+OgWm3dImPmd12hZhyiWfsr
 sLc8ds15D53bt9+e4awz16BKIX9fPoBjWslgdH3lUEWKxw1dVFXIZPMJwFAEiwT5w/sx
 VR3aDLQ8Jjmhm4n4NRwEzGlS/dibenqeGumEG1YJArbQ+hl+RAWyg/5uCcBTh9FS8OUF
 zBOvMAWtWqo8Cb/bmR1P+tm68LlPvAPN+nixgIZC1AYDmWu6UA82qVmOd+Wx3dIswjoA
 hirg==
X-Gm-Message-State: AOJu0YyLrbYGMxIUhdKzCS6mlUKyRXlvsG1OwWqCwYUY00h0iSlrEfio
 gh3sQx8mvS5mdnt8KV7O09ys3dB8mv2MeqkbB2rgP15UBgxXBrQp3bLBxK0gRcIduyeqxv3f6C1
 w
X-Gm-Gg: ASbGncv92TY69uWJDKyKcVbUNRk3bb8rVO4Z0FUAhpQDW8TIZjP8Pk1r7oWG4nerByH
 4fBfkDVkc3Tg4f3ILx1nXXdaCkM4y2hdS5oMtJuZpubPIJSBENILDukckK+J5MuwGhfdWgXFm8l
 pibIbCPXxUzsqwQl1vhJl7vehLaXHxkNQb3SBekBN++CRHDURIy/n14swr8OWopBHgqnLpf/bME
 YbuyiorvSeQ/k2Fjwzog7XIssbcREo+P+msc9XHlseMwBxYDz1Avmk5L6tbmgJa9aJxxnRz49QB
 Ph2ztvpR5r20gKvZ6XGNoHyGv6UIKGts4Ifi5ZBQ+VAqvFlUxxM=
X-Google-Smtp-Source: AGHT+IGcpodxHAQlFCov7Dw/ip1/zNTc1GmhEQYpiunbDJ0QVNu+GnXexMWVNEIPpKuvrI2QNm5WRg==
X-Received: by 2002:a05:600c:138a:b0:43d:224:86b5 with SMTP id
 5b1f17b1804b1-43d509e38eemr24686085e9.4.1742556326636; 
 Fri, 21 Mar 2025 04:25:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e6767sm2132614f8f.66.2025.03.21.04.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 04:25:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v2 1/3] rust: assertions: add static_assert
Date: Fri, 21 Mar 2025 11:25:21 +0000
Message-ID: <20250321112523.1774131-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321112523.1774131-1-peter.maydell@linaro.org>
References: <20250321112523.1774131-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 21 Mar 2025 11:25:31 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Add a new assertion that is similar to "const { assert!(...) }" but can be used
outside functions and with older versions of Rust.  A similar macro is found in
Linux, whereas the "static_assertions" crate has a const_assert macro that
produces worse error messages.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 rust/qemu-api/src/assertions.rs | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/rust/qemu-api/src/assertions.rs b/rust/qemu-api/src/assertions.rs
index 104dec39774..bba38cfda11 100644
--- a/rust/qemu-api/src/assertions.rs
+++ b/rust/qemu-api/src/assertions.rs
@@ -120,3 +120,25 @@ macro_rules! assert_match {
         );
     };
 }
+
+/// Assert at compile time that an expression is true.  This is similar
+/// to `const { assert!(...); }` but it works outside functions, as well as
+/// on versions of Rust before 1.79.
+///
+/// # Examples
+///
+/// ```
+/// # use qemu_api::static_assert;
+/// static_assert!("abc".len() == 3);
+/// ```
+///
+/// ```compile_fail
+/// # use qemu_api::static_assert;
+/// static_assert!("abc".len() == 2); // does not compile
+/// ```
+#[macro_export]
+macro_rules! static_assert {
+    ($x:expr) => {
+        const _: () = assert!($x);
+    };
+}
-- 
2.43.0


