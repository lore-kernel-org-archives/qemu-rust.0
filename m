Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAqFe-0003ia-7u
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 09:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uAplS-00061i-54
 for qemu-rust@nongnu.org; Fri, 02 May 2025 08:45:14 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uAplP-0007br-9F
 for qemu-rust@nongnu.org; Fri, 02 May 2025 08:45:12 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so11627165e9.1
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 05:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746189909; x=1746794709; darn=nongnu.org;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wbPnSyO/WCbfKavlxLxWhGakah80+RQ81JjBl7ovjQA=;
 b=aKzqI+KgDfSOtuu7f011GLnYy6MRSByXRuj/0e8NbVboV9BM5T7dB+9tOn+Q/1rDN5
 fsQ61CmPrx/UE7C1T/hlN1NkY37x4ySkvjOsSwLGka6FNw+03CgMoFa6sQH6ctHkbLxP
 BSgDr9hmwrJWG/DGJgnQND0vDCVNtuJ60iGRdKPpskVs5DYqZ9uElMdnVa7AmCVT1xgC
 UAv0XTVEdKe/O03zVdfKBBOAoHae3JiH+Lh8kinp8aNW9njYU+uWkx8qd90CP9bSTC2u
 hwcAHu2MQmuQXoyrpS/dPXKTjKifDEJN9c6pM9VyVxxYgM0LxORYtx9LP4py0fbmgsB9
 er6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746189909; x=1746794709;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wbPnSyO/WCbfKavlxLxWhGakah80+RQ81JjBl7ovjQA=;
 b=h1wswG70YwvJ1ryyfd+IqdIdy6CalUNLcdvfHAH6tB5lL+Rca5taCGuQbyh+Q9Emyu
 BeLxGumjv4bcAOoxE2vAn1tq4zc8zqWNW3sjMBwfDe7SRfIcRtazwUI0Iy552Y6XpM6j
 +BqRZUlzl4j8aG1RGu3sdmOO6mTeP5O3FgOOTyCq45oWdynYe1Q7UaX/EZRPCrNa6O3l
 NP9hvDUH4r8jr6ztGHyeC1C/5rGF1vQs+ajilNFopIcCMDGRYthXX9miHvMgfSLvCbY+
 Zu8vpdwJaRMcOp+r2dORW62zwFUYNhzBzgX3k5ucAXlck0QEgOpJbyEWvxpGSXMvGlD3
 dKkQ==
X-Gm-Message-State: AOJu0YwhDoYKCOTfWYxWPbiKX2OKQ6HRHEGtVUfVDI7Oq2SmY/7O0n0Z
 Ui0pyOOnvONg/6gCaNw7YvhkdGQlAFMxbKfzRCUFXJNt5KxT9E2VqH1mjLULQcs=
X-Gm-Gg: ASbGnctQIyv5G4N36nBFOdcig7rH9Gb6MNWnSGw8X9WrXJsaO3Eo8BS/OhkkgzROibS
 beOM2oNfAT/OWLfQLVWgEZkBfaLngHBk5pJ71cCGIrF+XisYnLT6WW6BeEKClQnTM4C5aSfNRDo
 F9TGjDL1Jf/6zO3fSfzJkH0I6Xgal9Acq2xtvMBmxEo7yNIbp4TK8VodOSQTp/VWZR0oSo8/pM+
 tEVf9dNlo1f/hB/Mxx87W3SYIme0ABe6XLg3wzIEv2PvtmCw6odN4e3qGhqmacu+a6INuv2AZzW
 9vLK4hXnBaabhLTJ8pKCm1q77oxnEtslYeb0DEdzOAID6uQkjGebD14brLT5RYSa3Oel7HSJdF2
 qFp1+rQ==
X-Google-Smtp-Source: AGHT+IFf6K/LWUxWTHV2+GpbF2DvBxr7xZ+hv7E7lNLI+m2chz0Hl8gyq04akU7Q6VZxRO1MzqZeaA==
X-Received: by 2002:a05:600c:828e:b0:441:b3eb:570c with SMTP id
 5b1f17b1804b1-441bb852676mr27417045e9.6.1746189909079; 
 Fri, 02 May 2025 05:45:09 -0700 (PDT)
Received: from meli-email.org (adsl-37.37.6.161.tellas.gr. [37.6.161.37])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b8a315d3sm43996935e9.36.2025.05.02.05.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 05:45:08 -0700 (PDT)
Date: Fri, 02 May 2025 15:44:10 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-rust@nongnu.org
Bcc: 
Subject: Re: [PATCH 3/9] rust: let bilge use "let ... else"
User-Agent: meli/0.8.12
References: <20250502102323.104815-1-pbonzini@redhat.com>
 <20250502102323.104815-4-pbonzini@redhat.com>
In-Reply-To: <20250502102323.104815-4-pbonzini@redhat.com>
Message-ID: <svmwr7.46e2vcedtq0m@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 02 May 2025 09:16:24 -0400
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
X-List-Received-Date: Fri, 02 May 2025 12:45:14 -0000

On Fri, 02 May 2025 13:23, Paolo Bonzini <pbonzini@redhat.com> wrote:
>Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>---
> docs/devel/rust.rst                           |  3 --
> subprojects/bilge-impl-0.2-rs.wrap            |  2 -
> .../packagefiles/bilge-impl-1.63.0.patch      | 45 -------------------
> 3 files changed, 50 deletions(-)
> delete mode 100644 subprojects/packagefiles/bilge-impl-1.63.0.patch
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

