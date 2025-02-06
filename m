Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tg0DT-0000h1-8L
	for mharc-qemu-rust@gnu.org; Thu, 06 Feb 2025 06:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tg0DR-0000fa-7H
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 06:38:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tg0DP-0002hW-0K
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 06:38:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738841917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fuCwd6gmcD0q8LQlCXMmaFkFh++j2NBuIIAJ2XPBjRs=;
 b=bn80VegOnfHsVKvxLMB/x2LfZDepWXVMTFYpJ2fSer5MBkxmx6x3GmpfOEd3SVSv44rmfh
 dCZz4iGN8cMxgKCyUiwJJI2lovhnEc7G5lHaXR5NptXifu4UXYeM8uES7+GVqcisGFWUIo
 cmhMvgTg6eDWIc+yNg/zHvrHl4hp4X0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-czQ8OWAjNlqjrQ_3yb6f-Q-1; Thu, 06 Feb 2025 06:38:36 -0500
X-MC-Unique: czQ8OWAjNlqjrQ_3yb6f-Q-1
X-Mimecast-MFC-AGG-ID: czQ8OWAjNlqjrQ_3yb6f-Q
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-436723db6c4so6193435e9.3
 for <qemu-rust@nongnu.org>; Thu, 06 Feb 2025 03:38:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738841915; x=1739446715;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fuCwd6gmcD0q8LQlCXMmaFkFh++j2NBuIIAJ2XPBjRs=;
 b=N7+Lk/rimcbBNPe36cq4O/N4TEiBxrWnUxUvi1/ium/BNJD58UG8HdMBWTzRX3TyLR
 J2Mm6fh26lrxyHeHA6F1o6GCWQHpjeQhU3dwg+roTALHyPRmsYqSdGndGi2WrBILWkXi
 LV+YC9iwlBrkA4wElVlAq1637xtZTYlc+QaKLlWQ5Q1oh01LGI9TCRO33xUs11nvFjSz
 94dV7la1dBCfeQlCMBEasLOrJnB3kUn1gOsLZ9p0RdACKYY3xQo0J8rVrBzAgggPGywn
 J1gZA4hKcypA0fYFx0jSq1XsTLKNdm70KQLmIENVFgswRM43a7Ox8mzD9Lvhf7euMhSp
 X9cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvGIkiKuQpPgXr0WzasVgSpZOGq1m15yDCp0r8IyzYXVM2nHMg4WhfVJYJtfMLPYqJJlD+NgAP3Jk=@nongnu.org
X-Gm-Message-State: AOJu0YwjXaF9ArSDtq2/8jOu7JEcWYNX7Kt4+iTaH9idmjWpPtJXvTfg
 +FJ1hfRvBl/7W+RNmhpekf8btyA69yKrkdJPfvvbKG2nKDcpuJIOEjzliC7YC6LNd/NEgYZf+KX
 IUB7+z9N6NX5HqzNWiCHle6fKoiWnQ5MclNVyr8Ec4rRovT1IJng+3QPgiPbASGOAL0b6v3EthZ
 w/LMHIIelnevCjkJRBh5fGg8yGAQ==
X-Gm-Gg: ASbGncuzumvHRJSGABWWk1j+CF1b7+Voz57p+bb9+WolveCLVzUH/+5J2GZuOalxbFl
 bV8Rmg3SNPH69VFFTpXDegVYsIAmuttL04fyYvc0i3sfyWwIC+eY2uzzfxr/s
X-Received: by 2002:a05:600c:4e09:b0:434:a5d1:9905 with SMTP id
 5b1f17b1804b1-4390d574c4bmr42007395e9.26.1738841915038; 
 Thu, 06 Feb 2025 03:38:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCT48Lsi5MtAl7N2AUeYfaeJIQNJPHAHVGarctUCAeBOjy2wFypVdb8gho0JFlcoZGGlKKgsuUyy9p2ffTKzw=
X-Received: by 2002:a05:600c:4e09:b0:434:a5d1:9905 with SMTP id
 5b1f17b1804b1-4390d574c4bmr42007275e9.26.1738841914732; Thu, 06 Feb 2025
 03:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20250206111514.2134895-1-pbonzini@redhat.com>
 <298a7473-e5e5-418d-8902-2cbd30730db6@linaro.org>
In-Reply-To: <298a7473-e5e5-418d-8902-2cbd30730db6@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 6 Feb 2025 12:38:20 +0100
X-Gm-Features: AWEUYZlBwJMKe0PFy_urG_tmTbfKNiaqXZ0UZfqzGJJ7wbNdiVM7OBs0AT10ELE
Message-ID: <CABgObfYzncjR=DtvE8asLfqJA89JjatMzs352F=4PbfTBrq1sw@mail.gmail.com>
Subject: Re: [PATCH] rust: add --rust-target option for bindgen
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, qemu-stable@nongnu.org, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: otF9qVgXy7gbR4v00oyPFWfOpo7vxOjp6-l1afTTSOI_1738841915
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 06 Feb 2025 11:38:41 -0000

On Thu, Feb 6, 2025 at 12:37=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
> >     if bindgen.version().version_compare('<0.61.0')
> >       # default in 0.61+
> >       bindgen_args +=3D ['--size_t-is-usize']
>
> Should this be merged directly on master as build-fix?

If it's breaking CI I can send a pull request later. I wasn't sure if
it was just my branch with other Rust changes.

Paolo


