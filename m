Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJqzi-0001To-7h
	for mharc-qemu-rust@gnu.org; Tue, 27 May 2025 05:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJqzg-0001Qx-3h
 for qemu-rust@nongnu.org; Tue, 27 May 2025 05:53:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJqza-00049N-6K
 for qemu-rust@nongnu.org; Tue, 27 May 2025 05:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748339584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HcOZWNq4tyb6y2JY7jepOLnfzaZcgBlZDJbnYi/E6Vc=;
 b=Zh5A2qmPLTXRkYq88pUAR7o2OuIyM0zVZuWbqkFI34EIlBkbqrFNMbkibUyIJOQRo6/FeT
 hwhgtaEG6QAu4brVMuRCiUuUSCyksSp6DkmV5xgk9OJTrcCAa3RgJgKMto1zubU8CS7xxO
 oFpWWScF1dOeDHOsKVCyZ9ARWpUs/IQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-dKV1c5UMPrepdo1dpozIXA-1; Tue, 27 May 2025 05:53:02 -0400
X-MC-Unique: dKV1c5UMPrepdo1dpozIXA-1
X-Mimecast-MFC-AGG-ID: dKV1c5UMPrepdo1dpozIXA_1748339581
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a362939f61so923037f8f.3
 for <qemu-rust@nongnu.org>; Tue, 27 May 2025 02:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748339581; x=1748944381;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HcOZWNq4tyb6y2JY7jepOLnfzaZcgBlZDJbnYi/E6Vc=;
 b=Il5stifN0atBzE9YMJfa5i15FXTLjd3LE8bBDgl/vqH49Bw3o6EICVPI1T6XesdvKq
 Av7hHU22jupFkQ81vLzHIcbe3cQZ5a621qMBYU+5ogbP9F3NKr3mNuIP1RDgOLw2tKRS
 U74kW8r0GnpLAKLqB4liPW2a335ptnTq6eCgh8J79Ek287Z8XEWNVqOVJBKlR+hmHVDX
 OTO7+eJwcwsSlnkp+TnpZ+woyGj0MGwGbkH/WzoPyZyDICR4z2M3j+ZY1wX/r0YynURJ
 xy8j8riAya0XPpjcsr7mQhrsgIBYiQvHq+2c6iO48GanhrfkqhDfvS9d+BzgMiN6YDoG
 rqIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAtv1lOAXrq7rrlafUzYAMuO8zbU31ns+sIiN5AzXwwI2l+amDGJLqRjkC6Kmc34ZTiGQ/+zujK9o=@nongnu.org
X-Gm-Message-State: AOJu0YxzJk0FyvWZm8zs4yQfSqEETHcj42AjQFnRNHbWJghc+u1RyxCW
 9XVD3r5wvR04qlCKLPM8mZ4Vz7BK3GbW+Y2e3/EtjtUG2c4uQcXuHOImJaqGVAl3O551i+ID1Ak
 9MtAPLwEn7xWt/eaCVmHtC0J0VE2v7saJYUBPCfFgvaAywH6DXSyqo9c=
X-Gm-Gg: ASbGnctlt9h1fGmUOYpBOkC+TZntjlvMoBL2UNoMHGYpf3VauiZXl2Y5HbweyiIQvWo
 d4p9l4N1wGQm7GFgta8XdHzCwQRXGBJAXh8lWjlKxD/vV/Okb4ai3YQYQW1dWblVPdPEE924Yvf
 6LAbkvVMFubP+mML/5vEnZxDBkXoS2A/11fshfHbXlzh5ZS2JIiAGkr6Q/a9x2dFd7DeS5XH8R2
 k0R5aYaWQtf+osK85OffU+K1oTdYm2rZSyAMas8LwniKc7SLCmEdmrrKpREvLKFHgtWZlhlZDhn
 rq6pPWOhMoRiVA==
X-Received: by 2002:a05:6000:1881:b0:3a4:c6bc:995b with SMTP id
 ffacd0b85a97d-3a4cb47b7f7mr10217708f8f.35.1748339581335; 
 Tue, 27 May 2025 02:53:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeOy5DtPQ2Rvkdkjrgdw9D8dDPIvQcSRA7SuewZkU8qHhYUsqMurFfl5LvteN/fBilZbh3oA==
X-Received: by 2002:a05:6000:1881:b0:3a4:c6bc:995b with SMTP id
 ffacd0b85a97d-3a4cb47b7f7mr10217692f8f.35.1748339580980; 
 Tue, 27 May 2025 02:53:00 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.46.79])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a4d50f96easm7070123f8f.79.2025.05.27.02.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 02:53:00 -0700 (PDT)
Message-ID: <642b5707-bef4-4110-b211-fde34179a6be@redhat.com>
Date: Tue, 27 May 2025 11:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] subprojects: add the anyhow crate
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, qemu-rust@nongnu.org
References: <20250526142254.1061009-1-pbonzini@redhat.com>
 <20250526142455.1061519-2-pbonzini@redhat.com> <aDWJrNpRbKjpKqOi@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <aDWJrNpRbKjpKqOi@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Vd-YUn8_t4kBq8A7UUcfZxNDKikkYfE2MAnVjghL5KQ_1748339581
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.903,
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
X-List-Received-Date: Tue, 27 May 2025 09:53:12 -0000

On 5/27/25 11:45, Zhao Liu wrote:
> On Mon, May 26, 2025 at 04:24:45PM +0200, Paolo Bonzini wrote:
>> Date: Mon, 26 May 2025 16:24:45 +0200
>> From: Paolo Bonzini <pbonzini@redhat.com>
>> Subject: [PATCH 02/12] subprojects: add the anyhow crate
>> X-Mailer: git-send-email 2.49.0
>>
>> This is a standard replacement for Box<dyn Error> which is more efficient (it only
>> occcupies one word) and provides a backtrace of the error.  This could be plumbed
>> into &error_abort in the future.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   rust/meson.build                              |  2 ++
>>   subprojects/.gitignore                        |  1 +
>>   subprojects/anyhow-1.0-rs.wrap                |  7 ++++
>>   .../packagefiles/anyhow-1.0-rs/meson.build    | 33 +++++++++++++++++++
>>   4 files changed, 43 insertions(+)
>>   create mode 100644 subprojects/anyhow-1.0-rs.wrap
>>   create mode 100644 subprojects/packagefiles/anyhow-1.0-rs/meson.build
> 
> Missed to change scripts/archive-source.sh & scripts/make-release?

Yes, also the wrap name should be anyhow-1-rs because only the "0" 
version gets an extra component.

Paolo


