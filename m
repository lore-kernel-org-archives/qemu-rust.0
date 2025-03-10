Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1trZcj-0000ic-NJ
	for mharc-qemu-rust@gnu.org; Mon, 10 Mar 2025 05:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1trZci-0000iD-NO
 for qemu-rust@nongnu.org; Mon, 10 Mar 2025 05:40:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1trZch-0001Ql-5e
 for qemu-rust@nongnu.org; Mon, 10 Mar 2025 05:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741599633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tmHJxcFEh1mCYGlFaYkTPG9EB1Ca7iOETAPsywJY5Uc=;
 b=PxmWAwgzjDjN7dTdJcrUpEJlfH5p3x7xytX+g05cNLYBLcojknFJhmtygKCPtp2Fqqj0jf
 YxQd4FAsPvqVMYzqCgPsNiFX7YHq0pL8UH3rH2oZSX4FhfKWqENV09RUy1FHHh/Akq3m4l
 LVTZYAfeywbb7BD9knl52HvSBxqIv2U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-X_HOJEevPEuma0Iv_YEkWw-1; Mon, 10 Mar 2025 05:40:32 -0400
X-MC-Unique: X_HOJEevPEuma0Iv_YEkWw-1
X-Mimecast-MFC-AGG-ID: X_HOJEevPEuma0Iv_YEkWw_1741599631
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43ceeaf1524so5441795e9.1
 for <qemu-rust@nongnu.org>; Mon, 10 Mar 2025 02:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741599631; x=1742204431;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tmHJxcFEh1mCYGlFaYkTPG9EB1Ca7iOETAPsywJY5Uc=;
 b=Q0CgRJiRVm2YLYRZt4jvY7yONHVJc4nWPx296O+aT8pUdfL6sMLbaLcpvcaRjIKdoA
 p+Ytll+Xfvjn7nXFe4Ngoe76PzC6kEG/q023T2ZqUVdPauSad6HagH9uSfqyugmvJ2Zi
 IdizyQF104Do27HnO+T8g/sFLyVZ2Jq2VeZdK3CG+ZsXFNTVJZSARQ0u2aGrR3y9TcX1
 VxwpObJ1MfhnNjA0Vm5Sg8YxfusliLAmptyeXj7YKsPZXn9NyzHaPAjhBsoY0/iVc7F0
 e27jMXr9Ljbhm+KyoDmvpoJGMBT5Yc6BY4ddu9mOyPs65ALbwxxuvCC9GuUghbANWh4P
 k1RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8UvSLt1qd0M309lCuG5LIPOKaAa+a4QyntrrNGV1A7Asxpzv0ajoaFC3JGUGomYJ3+3lboo7FTP0=@nongnu.org
X-Gm-Message-State: AOJu0YymbHd4DV6hFm1jD2JykV/Y9yL/s/uptfZ7oIRy50KJAT6yfT6s
 ABhEkRIELgJepfc3XfM/O08SPh3spiXMcHbdMAHqFG/92loahBZhdzCgGT8iNiDeLQZzJVNfpW2
 IUwusi5SeUDFKfqeg9+TP9xF/AZSUH/QDNYDXkQKbhLHq7T0vDY5oJc7psI/7ArzViU28p5oP10
 wL+iVB09nGBerSbJlVUB7rKJwnLg==
X-Gm-Gg: ASbGncuuXPSwsFoDUzSCNrdrJH63dE1X8Td9aVTP8H2PD6HHfvDAkFtrEbKwuYdFKL1
 J06SN5n+jk8FmgKT+aP7FpMWVEADqp6hoODYLqJdjDOyG0c41vkw9ekUREssnI/9proSc3JjQtl
 w=
X-Received: by 2002:a05:600c:354b:b0:439:4b23:9e8e with SMTP id
 5b1f17b1804b1-43ce4ab02eamr53337085e9.3.1741599631038; 
 Mon, 10 Mar 2025 02:40:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7CaPMMGzDZlld1SXT9851VkaXhrciPGHpJyPGEGV7kDWaYqRL7tlM+RkJ1Uff5ZsmvcQUST0OfxOAMsawnBQ=
X-Received: by 2002:a05:600c:354b:b0:439:4b23:9e8e with SMTP id
 5b1f17b1804b1-43ce4ab02eamr53336995e9.3.1741599630720; Mon, 10 Mar 2025
 02:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250129082045.1319203-1-pbonzini@redhat.com>
 <CAFEAcA9=G4sdXrxWcmq9wMqu1-ZRNxObQD3hmnFauYwiQr_8YQ@mail.gmail.com>
 <Z86v8Y70sGThWb_V@redhat.com>
In-Reply-To: <Z86v8Y70sGThWb_V@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 10 Mar 2025 10:40:18 +0100
X-Gm-Features: AQ5f1JqE_EJtHsDcLYrqTIo9M39ZhXOvT9g86e4DvDv8JT9wrzpfsP65WKVSOSI
Message-ID: <CABgObfbuj3SbqpDkUnKux1EWCudiksQxbWr_4Sck5tTLr5QqeA@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: include full Rust backtraces in test runs
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _Chts9bhJhmXKfomxIiOMbinmzbxbDynJzSiqF1sto4_1741599631
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 10 Mar 2025 09:40:37 -0000

On Mon, Mar 10, 2025 at 10:25=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@=
redhat.com> wrote:
> > This will only add the rust backtraces when the tests
> > are run from the CI logs, not when you locally run
> > "make check" or similar. There's probably a better place
> > to put this...
>
> Meson's  'test()' command accepts env variables, but it'll be somewhat
> tedious to add the same env to all case where we use test. Might want
> to define a common 'testenv' set at the top level meson.build and then
> reference it from every 'test()', unless meson has built-in support
> for globally applied env vars that I'm missing.

It can be added to add_test_setup().

Paolo


